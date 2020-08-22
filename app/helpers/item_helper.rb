module ItemHelper
    def analyze_events (item_id)

        # SELECT "events".* FROM "events" WHERE "events"."item_id" = <params[:id]> LIMIT 100
        @events = Event.where(:item_id => item_id).take(100)
        
        @events.sort! { |a, b| a.date_time <=> b.date_time }
        
        tracking = true
        quantity_delta = 0
        date_time_of_last_deplete = nil
        consumption_rates_per_day = []
        date_time_of_last_get = nil
        get_time_deltas = []
        
        # ANALYZE the selected elements (must be sorted by date_time)
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
                            consumption_rates_per_day.push( 86400 * quantity_delta / time_delta )
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

        average_consumption_rate_per_day = consumption_rates_per_day.inject{ |sum, value| sum + value }.to_f / consumption_rates_per_day.length
        average_get_time_delta = get_time_deltas.inject{ |sum, value| sum + value }.to_f / get_time_deltas.length
        
        item_object = @item.as_json(
            :include => {
                :events => {
                :except => [ :updated_at, :created_at ]
                }
            },
            :except => [ :updated_at, :created_at ]
        )
        
        Item.find(item_id).update({
            :average_consumption_rate_per_day => average_consumption_rate_per_day,
            :average_get_time_delta => average_get_time_delta
        })
    end
end