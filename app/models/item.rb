class Item < ApplicationRecord
  belongs_to :unit
  belongs_to :supply
  has_many :events
end
