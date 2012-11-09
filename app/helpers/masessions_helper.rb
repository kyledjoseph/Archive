module MasessionsHelper
    def masign_in(manufacturer)
        cookies.permanent[:remember_token] = manufacturer.remember_token
        self.macurrent_user = manufacturer
    end
    
    def masigned_in?
        !macurrent_user.nil?
    end
    
    def macurrent_user=(manufacturer)
        @macurrent_user = manufacturer
    end
    
    def macurrent_user
        @macurrent_user ||= Manufacturer.find_by_remember_token(cookies[:remember_token])
    end
    
    def masign_out
        cookies.delete(:remember_token)
        self.macurrent_user = nil
    end

end
