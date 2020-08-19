# Project Overview

### Repositories
[API](https://github.com/mxkay/supply_backend)
[Client](https://github.com/mxkay/supply_client)

### Description:

An inventory management system for small and medium scale groups, such as a household sharing groceries, a small company sharing office supplies, or a community sharing tools. This app favors user comfort over rigorous data entry, so users can use this app casually and only when they need something from it.

### User Stories

- As a user, I should be able to know what items are in stock, and what we need more of.
- As a user, when I am out shopping, the app should provide useful statistics to help me make better informed purchases.
- As a user, I should not have to input a lot of precise data to make the app work.
- As a group of users, we should all be able to interact with the app independently without breaking the tracking system.
- As a group of users, it should be easy to add and remove users to/from our group.

### [Wireframes](https://miro.com/app/board/o9J_koemixg=/)

#### MVP
- Deploy backend on Heroku
- Users can access a group and its supplies
- Users can report that an item is depleted, almost depleted, or replenished
- Users can specify the appropriate unit type and unit (e.g. mass and grams) when inputing and reading data
- Users can view a feed of supply activity
- Users can view statistical information about any item in the supply
- User is served consumption statistics to help them make better informed purchases

### Post MVP
- Item quantities are continually estimated based on agrigate data, and items are flagged as almost depleted
- Users can create, edit, and delete supplies
- Users can create, edit, and delete items in the supply
- Users can view a live, sorted inventory that helps with shopping
- Users can normalize the inventory to a specified period of time
- User can recieve push notifications alerting them of changes to the supply
- User can add, edit, and remove users (including themself) from a group
- Users have different permissions within a group
- User can track and split costs, track debts, and make payments to other users to settle debts (Splitwise functionality)
- Users can sign in with passwords using third party authentication
- Deplot to the app store & play store

### Components

- App
- Layout
- GroupTitle
- FooterButtonsContainer
- CreateGroup
- GroupSearch
- SignIn
- Home
- SupplyGrid
- SupplyTile
- Activity
- EventFeed
- Event
- Inventory
- InventoryFeed
- InventoryFeedSection
- InventoryItem
- ItemDetails
- ItemStatistics
- ReplenishButton
- AlmostDepleteButton
- DepleteButton
- ItemForm
- SearchBar

### Timetable

##### MVP
|  Task  |  Estimated Time  |  Actual Time  |
|---|---|---|
|  Build basic backend                  |  8 h  |    |
|  Host backend on Heroku               |  1 h  |    |
|  Add data analysis to backend         |  20 h  |    |
|  Build Layout component               |  3 h  |    |
|  Add navigation buttons               |  3 h  |    |
|  Build Home page                      |  1 h  |    |
|  Build EventFeed components           |  4 h  |    |
|  Build Activity page                  |  1 h  |    |
|  Build ItemSearchBar component        |  4 h  |    |
|  Build EventCreate component          |  3 h  |    |
|  Build ItemDetails component          |  4 h  |    |
| Total                                 |  52 h  |    |

### Timeline

Wednesday
- Build basic backend
- Host backend on Heroku

Thursday
- Add data analysis to backend
- Build Layout component

Friday
- Add navigation buttons
- Build Home page

Saturday
- Build EventFeed components
- Build Activity page

Sunday
- Build CreateEvent

Monday
- Build ItemSearchBar component
- Build ItemDetails page

Tuesday
- Finishing touches

### Additional Libraries
- React Native
- Expo
- React Native Elements
- Bootstrap
- Axios
- FontAwesome

### Code Snippets

This is a helper module in my backend that analyzes the events belonging to a specified item and updates the appropriate attributes of that event
```ruby
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
        
        item_object = @item.as_json(
            :include => {
                :events => {
                :except => [ :updated_at, :created_at ]
                }
            },
            :except => [ :updated_at, :created_at ]
        )
        
        average_consumption_rate_per_day = consumption_rates_per_day.inject{ |sum, value| sum + value }.to_f / consumption_rates_per_day.length
        average_get_time_delta = get_time_deltas.inject{ |sum, value| sum + value }.to_f / get_time_deltas.length
    
        Item.find(item_id).update({
            :average_consumption_rate_per_day => average_consumption_rate_per_day,
            :average_get_time_delta => average_get_time_delta
        })
    end
end
```