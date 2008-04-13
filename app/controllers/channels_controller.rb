class ChannelsController < ApplicationController
  def index
    @channels = Channel::ORDERED.map { |c| Channel.find_by_name(c) }
  end
end
