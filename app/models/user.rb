class User < ActiveRecord::Base
    attr_accessible :admin
    has_many :reviews
    has_many :wishitems
    has_many :myitems
    has_many :collections
    has_many :comments
    has_many :comparisons
    has_many :emails
    
    def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
    
    #user.admin = auth.admin
            user.oauth_token = auth.credentials.token
            
    #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            
            user.save!
        end
    end
    
#attr_accessible :admin, :email, :name, :screenname, :password_digest, :password, :password_confirmation
    #has_secure_password
    
    #before_save { self.email.downcase! }
    #before_save :create_remember_token
    
    #validates :name, presence: true, length: { maximum: 50 }
    #validates :screenname, presence: true, length: { maximum: 50 }
    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #validates :email, presence:   true,
    #  format:     { with: VALID_EMAIL_REGEX },
    #  uniqueness: { case_sensitive: false }
    
    #validates :password, presence: true, length: { minimum: 6 }
    #validates :password_confirmation, presence: true
    
    
    
    private
    
    def create_remember_token
        self.remember_token = SecureRandom.base64.tr("+/", "-_")
    end
end
