class Wishitem < ActiveRecord::Base
  belongs_to :user
    attr_accessible :product_id, :user_id
end
