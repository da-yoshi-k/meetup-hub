class EventsController < ApplicationController
  before_action :set_purpose_options, only: [:new, :edit]
  before_action :set_priority_conditions, only: [:new, :edit]
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
      flash[:success] = t '.success'
      redirect_to event_path(@event), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    event = current_user.events.find(params[:id])
    if event.update(event_params)
      flash[:success] = t '.success'
      redirect_to event_path(event), status: :see_other
    else
      @event = event
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = current_user.events.find(params[:id])
    event.destroy!
    flash[:success] = t '.success'
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :purpose, :description, :max_participants, :priority_condition)
  end

  def set_purpose_options
    @purpose_options = %w[飲食店に行く カラオケで歌う スポーツをする 会議スペースで集まる]
  end

  def set_priority_conditions
    @priority_conditions = %w[全員の指定した場所の中間地点 主催者の指定する場所 安価に過ごせる場所]
  end
end
