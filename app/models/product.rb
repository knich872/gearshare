class Product < ApplicationRecord
  enum category: [ :cameras, :clothes, :appliances, :jewelry, :sports, :outdoors, :events, :transportation, :tools, :baby ]
end
