class SessionsController < ApplicationController
    def new
        end
    
    def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to user
        #user = User.find_by_email(params[:session][:email])
        #if user && user.authenticate(params[:session][:password])
        # sign_in user
        # redirect_to user
        # else
        #  flash.now[:error] = 'Invalid email/password combination'
        #  render 'new'
        # end
        
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url
        #sign_out
        #redirect_to root_path
    end
    
    def failure
        redirect_to root_url, alert: "Authentication failed, please try again."
    end

end
