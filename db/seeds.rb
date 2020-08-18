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


def generate_events(iterations, item, users_array, deltas_array, inverse_consumption_rates_array, get_delays_array)
    day = 86400
    now = Time.now - day * (deltas_array * inverse_consumption_rates_array.sample - get_delays_array.sample)
    events = []
    current_type = "GET"
    current_quantity = 0

    iterations.times do
        if current_type == "GET"
            now -= day * get_delays_array.sample
            delta = deltas_array.sample
            current_quantity += delta
            current_type = "DEPLETE"
            
            events.push({
                :date_time => now,
                :event_type => "GET",
                :delta => delta,
                :item => item,
                :user => users_array.sample
            })
        elsif current_type == "DEPLETE"
            now -= day * current_quantity * inverse_consumption_rates_array.sample
            current_quantity = 0
            current_type = "GET"

            events.push({
                :date_time => now,
                :event_type => "DEPLETE",
                :delta => nil,
                :item => item,
                :user => users_array.sample
            })
        end
    end

    Event.create!(events)
end

generate_events(
    100,
    Item.where(name: "bread").take,
    [kay],      # users_array
    [1,2,3],    # deltas_array
    [4,5,6,7],  # inverse_consumption_rates_array
    [0,1,2,3]   # get_delays_array
)

generate_events(
    100,
    Item.where(name: "apples").take,
    [kay],
    [5,6,7,8,9,10,11,12,13,14,15,16],
    [1,1.5,2],
    [0,1,2]
)

generate_events(
    100,
    Item.where(name: "mustard").take,
    [kay],
    [1,2],
    [12,13,14,14,14,15,16,17,18],
    [0,1,2,3]
)

generate_events(
    100,
    Item.where(name: "ketchup").take,
    [kay],
    [1,2],
    [12,13,14,14,14,15,16,17,18],
    [0,1,2,3]
)

generate_events(
    100,
    Item.where(name: "lettuce").take,
    [kay],
    [1,2,3,4],
    [8,9,10,11,12,13,14],
    [0,1,2,3]
)

generate_events(
    100,
    Item.where(name: "rice").take,
    [kay],
    [1,2,3,4],
    [30,31,36,38,41,42,46,48,52,54,55,59,60],
    [0,1,2,3]
)

generate_events(
    100,
    Item.where(name: "lentils").take,
    [kay],
    [1,2,3,4],
    [30,31,36,38,41,42,46,48,52,54,55,59,60],
    [0,1,2,3]
)

generate_events(
    100,
    Item.where(name: "milk").take,
    [kay],
    [1,2],
    [12,13,14,14,14,15],
    [0,1,2,3]
)

generate_events(
    100,
    Item.where(name: "orange juice").take,
    [kay],
    [1,2],
    [12,13,14,14,14,15],
    [0,1,2,3]
)

# Event.create!([
    # {
    #     :date_time => now,
    #     :event_type => "START",
    #     :delta => nil,
    #     :item => Item.where(name: "bread").take,
    #     :user => kay
    # },
#     {
#         :date_time => now + 2 * day,
#         :event_type => "GET",
#         :delta => 2,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 4 * day,
#         :event_type => "DEPLETE",
#         :delta => nil,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 6 * day,
#         :event_type => "GET",
#         :delta => 2,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 8 * day,
#         :event_type => "DEPLETE",
#         :delta => nil,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 9 * day,
#         :event_type => "DEPLETE",
#         :delta => nil,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 10 * day,
#         :event_type => "GET",
#         :delta => 2,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 12 * day,
#         :event_type => "DEPLETE",
#         :delta => nil,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 14 * day,
#         :event_type => "GET",
#         :delta => 2,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 16 * day,
#         :event_type => "DEPLETE",
#         :delta => nil,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 19 * day,
#         :event_type => "GET",
#         :delta => 1,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 20 * day,
#         :event_type => "DEPLETE",
#         :delta => nil,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
#     {
#         :date_time => now + 22 * day,
#         :event_type => "GET",
#         :delta => 2,
#         :item => Item.where(name: "bread").take,
#         :user => kay
#     },
# ])