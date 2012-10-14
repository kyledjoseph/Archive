class Myitem < ActiveRecord::Base
  belongs_to :user
    attr_accessible :current_value, :extra_notes, :item_recall, :location_of_manual, :price, :product_id, :purchase_date, :purchase_proof, :rental_value, :repair_locations, :resale_value, :collection
end
