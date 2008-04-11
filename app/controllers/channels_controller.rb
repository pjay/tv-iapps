class ChannelsController < ApplicationController
  def index
    @channels = Channel::ORDERED.map { |c| Channel.find_by_name(c) }
  end

  def refresh
    require 'tsr_parser'
    Show.destroy_all
    TSRParser.start
    redirect_to root_url
  end
end
