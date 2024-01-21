class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    redirect_to login_path unless logged_in?
    @event = Event.new
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def create
    redirect_to login_path unless logged_in?
    @event = Event.new(event_params.merge(user: current_user))
    if @event.save
      redirect_to event_path(@event), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    event = current_user.events.find(params[:id])
    if event.update(event_params)
      redirect_to event_path(event), status: :see_other
    else
      @event = event
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = current_user.events.find(params[:id])
    event.destroy!
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at)
  end
end
