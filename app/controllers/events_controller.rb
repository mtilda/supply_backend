class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET groups/1/supplies/1/events
  # GET groups/1/supplies/1/items/1/events
  def index
    params[:item_id] ?
      @events = Event.joins(:item)
        .where(
          item_id: params[:item_id],
          items: {supply_id: params[:supply_id]}
        )
        .order(date_time: :desc)
        .limit(100)
    : @events = Event.joins(:item)
      .where(
        items: {supply_id: params[:supply_id]}
      )
      .order(date_time: :desc)
      .limit(100)
    
    render json: @events.as_json(
      :only => [:date_time, :event_type, :delta],
      :include => [
        :user => {:only => [:id, :name]},
        :item => {
          :only => [:id, :name],
          :include => {:unit => {
            :only => [:symbol, :singular, :plural],
            :except => [:created_at, :updated_at]}}
        }
      ],
      :except => [:created_at, :updated_at]
    )
  end

  # POST groups/1/supplies/1/items/1/events
  def create
    @event = Event.new(event_params)
    @event.item_id = params[:item_id]

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event, :date_time, :event_type, :user_id).permit(:delta)
    end
end
