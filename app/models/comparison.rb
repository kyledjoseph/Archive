class Comparison < ActiveRecord::Base
  belongs_to :user
  attr_accessible :product_id
end
