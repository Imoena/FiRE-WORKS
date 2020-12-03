class Admins::EventsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @lat = @event.latitude
    @lng = @event.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def create
    @event = Event.new(event_params)
    @event.latitude = params["latitude"]
    @event.longitude = params["longitude"]
    if @event.save
      redirect_to admins_events_path(@event)
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admins_events_path, notice: "削除しました"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admins_events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:festival, :content, :prefecture, :city, :transportation, :addres, :latitude, :longitude, :event_image, :start_time)
  end
end
