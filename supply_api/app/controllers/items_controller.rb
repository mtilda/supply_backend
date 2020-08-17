require 'time'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show

    # SELECT "events".* FROM "events" WHERE "events"."item_id" = <params[:id]> LIMIT 100
    @events = Event.where(:item_id => params[:id]).take(100)

    @events.sort! { |a, b| a.date_time <=> b.date_time }
    
    tracking = true
    quantity_delta = 0
    date_time_of_last_deplete = nil
    consumption_rates = []
    date_time_of_last_get = nil
    get_time_deltas = []
    
    # ANALYZE the selected elements
    # DO some action based on the event_type
    @events.each do |event|

      case event.event_type

      when "START"
        tracking = true
        quantity_delta = 0
        date_time_of_last_deplete = nil
        date_time_of_last_get = nil

      when "STOP"
        tracking = false
        quantity_delta = 0
        date_time_of_last_deplete = nil
        date_time_of_last_get = nil

      when "GET"
        if tracking
          
          if date_time_of_last_get

            time_delta = event.date_time - date_time_of_last_get

            if time_delta >= 0
              get_time_deltas.push( (time_delta / 86400).floor )
            else
              raise "invalid date_time comparison, events must be sorted in chronological order before analyzing"
            end
          end
          
          quantity_delta += event.delta.to_f
          date_time_of_last_get = event.date_time
        end

      when "DEPLETE"
        if tracking
          
          if date_time_of_last_deplete && quantity_delta > 0

            time_delta = event.date_time - date_time_of_last_deplete
            
            if time_delta >= 0
              consumption_rates.push( 86400 * quantity_delta / time_delta )
            else
              raise "invalid date_time comparison, events must be sorted in chronological order before analyzing"
            end
          end

          quantity_delta = 0
          date_time_of_last_deplete = event.date_time
        end

      else
        raise "invalid event_type: #{event.event_type}, event id: #{event.id}"
      end
    end

    item_object = @item.as_json(
      :include => {
        :events => {
          :except => [ :updated_at, :created_at ]
        }
      },
      :except => [ :updated_at, :created_at ]
    )

    # APPEND average_consumption and average_frequency to item_object
    item_object[:consumption_rates] = consumption_rates
    item_object[:get_time_deltas] = get_time_deltas

    render :json => { :item => item_object }
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :unit_id, :expiration, :is_tracked, :is_depleted, :is_running_out, :supply_id)
    end
end
