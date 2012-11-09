class Supercomment < ActiveRecord::Base
    attr_accessible :content, :link, :manufacturer_id, :retailer_id, :status
end
