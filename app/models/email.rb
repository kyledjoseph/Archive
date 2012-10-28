class Email < ActiveRecord::Base
  belongs_to :user
  attr_accessible :product_id, :recipient
end
