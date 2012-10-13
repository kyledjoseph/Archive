class Review < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :product_id
end
