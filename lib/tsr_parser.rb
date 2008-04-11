gem 'hpricot'
require 'hpricot'
require 'open-uri'
require 'iconv'

class TSRParser
  BASE_URL = 'http://www.tsr.ch/tsr/index.html?siteSect=601000'
  CHANNELS = {
    'TSR1'      => 1,
    'TSR2'      => 2,
    'HDsuisse'  => 3,
    'Arte'      => 10,
    'Canal+'    => 11,
    'Eurosport' => 12,
    'France2'   => 13,
    'France3'   => 14,
    'France5'   => 15,
    'M6'        => 16,
    'RTL9'      => 17,
    'SF1'       => 18,
    'SF2'       => 19,
    'TF1'       => 20,
    'TMC'       => 21,
    'TSI'       => 22,
    'TSI2'      => 23,
    'TV5'       => 24
  }

  def self.start
    iconv = Iconv.new('UTF-8', 'ISO-8859-1')

    CHANNELS.each do |channel_name, tsr_channel_id|
      channel = Channel.find_or_create_by_name(channel_name)
      tries = 0
      begin
        tries += 1
        doc = Hpricot(open(BASE_URL + "&idChaine=#{tsr_channel_id}"))
      rescue Timeout::Error => e
        raise if tries >= 3
        retry
      end
      (doc/"div.progDay").each do |show|
        time =     iconv.iconv((show/".dayTime").inner_html.strip)
        title =    iconv.iconv((show/".dayTitle").inner_html.strip)
        subtitle = iconv.iconv((show/".daySubTitle").inner_html.strip)
        next if time.blank? || title.blank?
        channel.shows.create! :time => time, :title => title, :subtitle => subtitle
      end
    end
  end
end
