class Channel < ActiveRecord::Base
  has_many :shows

  validates_presence_of :name

  ORDERED = %w(TSR1 TSR2 TF1 France2 France3 M6 France5 TV5 Arte RTL9 Eurosport Canal+)
end
