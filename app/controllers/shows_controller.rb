class ShowsController < ApplicationController
  def show
    @show = Show.find(params[:id])
    render :layout => false
  end
end
