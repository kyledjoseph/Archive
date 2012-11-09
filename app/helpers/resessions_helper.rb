module ResessionsHelper
    def resign_in(retailer)
        cookies.permanent[:remember_token] = retailer.remember_token
        self.recurrent_user = retailer
    end
    
    def resigned_in?
        !recurrent_user.nil?
    end
    
    def recurrent_user=(retailer)
        @recurrent_user = retailer
    end
    
    def recurrent_user
        @recurrent_user ||= Retailer.find_by_remember_token(cookies[:remember_token])
    end
    
    def resign_out
        cookies.delete(:remember_token)
        self.recurrent_user = nil
    end

end
