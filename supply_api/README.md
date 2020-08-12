
## Build instructions

### Step 1: Scaffolds
``` ruby
rails db:create
rails g scaffold unit symbol singular plural
rails g scaffold group name url
rails g scaffold user name handle email password group:references
rails g scaffold supply name color group:references
rails g scaffold item name unit:references expiration:integer is_tracked:boolean is_depleted:boolean is_running_out:boolean supply:references
rails g scaffold event date_time:datetime event_type delta item:references user:references
rails db:migrate
```

### Step 2: Models
> app > models > unit.rb
``` ruby
class Unit < ApplicationRecord
  has_many :items
end
```

> app > models > user.rb
``` ruby
class User < ApplicationRecord
  belongs_to :group
  has_many :events
end
```

> app > models > group.rb
``` ruby
class Group < ApplicationRecord
    has_many :users
    has_many :supplies
end
```

> app > models > supply.rb
``` ruby
class Supply < ApplicationRecord
  belongs_to :group
  has_many :items
end
```

> app > models > item.rb
``` ruby
class Item < ApplicationRecord
  belongs_to :unit
  belongs_to :supply
  has_many :events
end
```

> app > models > event.rb
``` ruby
class Event < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
```

### Step 3: Seed
> db > seed.rb
```ruby
Unit.create!([
    # metric mass
    { :symbol => "t",   :singular => "tonne",       :plural => "tonnes"     },
    { :symbol => "kg",  :singular => "kilogram",    :plural => "kilograms"  },
    { :symbol => "g",   :singular => "gram",        :plural => "grams"      },
    { :symbol => "mg",  :singular => "milligram",   :plural => "milligrams" },
    { :symbol => "μg",  :singular => "microgram",   :plural => "micrograms" },

    # imperial mass
    { :symbol => "lb",  :singular => "pound",       :plural => "pounds" },
    { :symbol => "oz",  :singular => "ounce",       :plural => "ounces" },

    # metric length
    { :symbol => "km",  :singular => "kilometer",   :plural => "kilometers"     },
    { :symbol => "hm",  :singular => "hectometer",  :plural => "hectometers"    },
    { :symbol => "dam", :singular => "decameter",   :plural => "decameters"     },
    { :symbol => "m",   :singular => "meter",       :plural => "meters"         },
    { :symbol => "dm",  :singular => "decimeter",   :plural => "decimeters"     },
    { :symbol => "cm",  :singular => "centimeter",  :plural => "centimeters"    },
    { :symbol => "mm",  :singular => "millimeter",  :plural => "millimeters"    },

    # imperial length
    { :symbol => "mi",  :singular => "mile",        :plural => "miles"  },
    { :symbol => "yd",  :singular => "yard",        :plural => "yards"  },
    { :symbol => "ft",  :singular => "foot",        :plural => "feet"   },
    { :symbol => "in",  :singular => "inch",        :plural => "inches" },

    # metric area
    { :symbol => "kms²",    :singular => "square kilometer",    :plural => "square kilometers"   },
    { :symbol => "hms²",    :singular => "square hectometer",   :plural => "square hectometers"  },
    { :symbol => "dams²",   :singular => "square decameter",    :plural => "square decameters"   },
    { :symbol => "ms²",     :singular => "square meter",        :plural => "square meters"       },
    { :symbol => "dms²",    :singular => "square decimeter",    :plural => "square decimeters"   },
    { :symbol => "cms²",    :singular => "square centimeter",   :plural => "square centimeters"  },
    { :symbol => "mms²",    :singular => "square millimeter",   :plural => "square millimeters"  },

    # imperial area
    { :symbol => "mi²",     :singular => "square mile",         :plural => "square miles"    },
    { :symbol => "yd²",     :singular => "square yard",         :plural => "square yards"    },
    { :symbol => "ft²",     :singular => "square foot",         :plural => "square feet"     },
    { :symbol => "in²",     :singular => "square inch",         :plural => "square inches"   },

    # metric volume
    { :symbol => "kms³",    :singular => "cubic kilometer",     :plural => "cubic kilometers"   },
    { :symbol => "hms³",    :singular => "cubic hectometer",    :plural => "cubic hectometers"  },
    { :symbol => "dams³",   :singular => "cubic decameter",     :plural => "cubic decameters"   },
    { :symbol => "ms³",     :singular => "cubic meter",         :plural => "cubic meters"       },
    { :symbol => "dms³",    :singular => "cubic decimeter",     :plural => "cubic decimeters"   },
    { :symbol => "cms³",    :singular => "cubic centimeter",    :plural => "cubic centimeters"  },
    { :symbol => "mms³",    :singular => "cubic millimeter",    :plural => "cubic millimeters"  },
    
    { :symbol => "kms³",    :singular => "kiloliter",           :plural => "kiloliters"   },
    { :symbol => "hms³",    :singular => "hectoliter",          :plural => "hectoliters"  },
    { :symbol => "dams³",   :singular => "decaliter",           :plural => "decaliters"   },
    { :symbol => "ms³",     :singular => "liter",               :plural => "liters"       },
    { :symbol => "dms³",    :singular => "deciliter",           :plural => "deciliters"   },
    { :symbol => "cms³",    :singular => "centiliter",          :plural => "centiliters"  },
    { :symbol => "mms³",    :singular => "milliliter",          :plural => "milliliters"  },

    # imperial volume
    { :symbol => "mi³",     :singular => "cubic mile",          :plural => "cubic miles"    },
    { :symbol => "yd³",     :singular => "cubic yard",          :plural => "cubic yards"    },
    { :symbol => "ft³",     :singular => "cubic foot",          :plural => "cubic feet"     },
    { :symbol => "in³",     :singular => "cubic inch",          :plural => "cubic inches"   },
    { :symbol => "bbl",     :singular => "barrel",              :plural => "barrels"        },
    { :symbol => "gal",     :singular => "gallon",              :plural => "gallons"        },
    { :symbol => "qt",      :singular => "quart",               :plural => "quarts"         },
    { :symbol => "pt",      :singular => "pint",                :plural => "pints"          },
    { :symbol => "c",       :singular => "cup",                 :plural => "cups"           },
    { :symbol => "fl.oz",   :singular => "fluid ounce",         :plural => "fluid ounces"   },

    # special units
    { :symbol => "cnt",     :singular => "",                    :plural => ""               },
    { :symbol => "btl",     :singular => "bottle",              :plural => "bottles"        },
    { :symbol => "cn",      :singular => "can",                 :plural => "cans"           },
    { :symbol => "bnc",     :singular => "bunch",               :plural => "bunches"        },
    { :symbol => "lf",      :singular => "loaf",                :plural => "loaves"         },
    { :symbol => "pck",     :singular => "pack",                :plural => "packs"          },
    { :symbol => "bx",      :singular => "box",                 :plural => "boxes"          },
    { :symbol => "tb",      :singular => "tub",                 :plural => "tubs"           },
    { :symbol => "bg",      :singular => "bag",                 :plural => "bags"           },
    { :symbol => "hd",      :singular => "head",                :plural => "heads"          },
])

house = Group.create!({ :name => "House", :url => "house" })

kay = User.create!( :name => "Kay", :handle => "mxk", :email => "mx@k.com", :group => house )

house_groceries = Supply.create!({ :name => "Groceries", :color => "orange", :group => house })
house_tools = Supply.create!({ :name => "Tools", :color => "grey", :group => house })
house_medicine = Supply.create!({ :name => "Medicine", :color => "blue", :group => house })
house_office = Supply.create!({ :name => "Office", :color => "red", :group => house })
house_cleaning = Supply.create!({ :name => "Cleaning", :color => "teal", :group => house })
house_gardening = Supply.create!({ :name => "Gardening", :color => "green", :group => house })

grocery_items = Item.create!([
    {
        :name => "bread",
        :unit => Unit.where(singular: "loaf").take,
        :expiration => 14,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "apples",
        :unit => Unit.where(symbol: "cnt").take,
        :expiration => 42,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "mustard",
        :unit => Unit.where(singular: "bottle").take,
        :expiration => 60,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "ketchup",
        :unit => Unit.where(singular: "bottle").take,
        :expiration => 60,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "lettuce",
        :unit => Unit.where(singular: "head").take,
        :expiration => 21,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "rice",
        :unit => Unit.where(singular: "pound").take,
        :expiration => 1461,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "lentils",
        :unit => Unit.where(singular: "pound").take,
        :expiration => 365,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "milk",
        :unit => Unit.where(singular: "gallon").take,
        :expiration => 20,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
    {
        :name => "orange juice",
        :unit => Unit.where(singular: "gallon").take,
        :expiration => 14,
        :is_tracked => true,
        :is_depleted => false,
        :is_running_out => false,
        :supply => house_groceries
    },
])

require 'time'
now = Time.now

Event.create!([
    {
        :date_time => now,
        :event_type => "START",
        :delta => nil,
        :item => Item.where(name: "bread").take,
        :user => kay
    },
    {
        :date_time => now,
        :event_type => "START",
        :delta => nil,
        :item => Item.where(name: "apples").take,
        :user => kay
    },
])
```

Run `rails db:seed` to execute the seed file

### Step 4: Routes

> config > routes.rb
```ruby
Rails.application.routes.draw do
  resources :units, only: [:index, :show]
  resources :groups, only: [:create, :destroy, :index, :show, :update] do
    resources :supplies, only: [:create, :destroy, :index, :show, :update] do
      resources :events, only: [:index]
      resources :items, only: [:create, :destroy, :index, :show, :update] do
        resources :events, only: [:index, :create]
      end
      resources :users, only: [:create, :destroy, :index, :show, :update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

### Step 5: Controllers

