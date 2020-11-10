class Users::EventsController < ApplicationController

  def index
  	@event = Event.all
  end

  def show
  	@event = Event.find(params[:id])
    @post = Post.where(event_id: params[:id])
    @lat = @event.latitude
    @lng = @event.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

end
