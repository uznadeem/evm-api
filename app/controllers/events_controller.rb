class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :update, :destroy, :join, :leave]

  def index
    @events = Event.include(:users)

    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = current_user.organized_events.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @event

    @event.destroy
  end

  def join
    @event.events_users.create(user: current_user)
    render json: @event
  end

  def leave
    current_user.events.delete(@event)
    render json: @event
  end

  private
    def set_event
      @event = Event.find_by(id: params[:id])

      render json: { error: "Can't find event" }, status: :unprocessable_entity
    end

    def event_params
      params.fetch(:event).permit(:name, :description, :start_time, :end_time, :image)
    end
end
