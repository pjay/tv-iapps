class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
