class Identity < OmniAuth::Identity::Models::ActiveRecord
    attr_accessible :email, :name, :password_digest, :password, :password_confirmation, :admin
   
    
    validates_presence_of :name
    validates_uniqueness_of :email
    validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
    
end
