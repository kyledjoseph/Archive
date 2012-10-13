class Product < ActiveRecord::Base
    
    attr_accessible :brand, :dimensions, :keywords, :manufacturer_link, :name, :price, :weight, :photo
    has_attached_file :photo, :styles => { :thumb=> "100x100#", :small  => "150x150>" },
    :url => "/assets/products/photos/:id/:basename.:extension",
    :path => ":rails_root/public/assets/products/photos/:id/:basename.:extension"
end
