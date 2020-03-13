class EventsController < ApplicationController
  def index
  end

  def new
  end

  def show
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
