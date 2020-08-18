require 'time'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  include ItemHelper

  # GET /items
  def index
    @items = Item.all

    @items.each do |item|
      analyze_events(item.id)
    end

    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    
    analyze_events(params[:id])

    @item = Item.find(params[:id])

    render :json => @item.to_json(
      :only => [
        :id,
        :name,
        :expiration,
        :is_tracked,
        :is_depleted,
        :is_running_out,
        :average_consumption_rate_per_day,
        :average_get_time_delta
      ],
      :include => {
        :unit => {
          :only => [:symbol, :singular, :plural]
        }
      }
    )
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
