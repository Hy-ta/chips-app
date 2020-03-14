class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(:event_params)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
  end

  def edit
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :img, :user_id)
  end
end
