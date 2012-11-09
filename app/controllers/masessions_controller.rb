class MasessionsController < ApplicationController
    def new
    end
    
    def create
        manufacturer = Manufacturer.find_by_email(params[:masession][:email].downcase)
        if manufacturer && manufacturer.authenticate(params[:masession][:password])
            masign_in manufacturer
           
            redirect_to manufacturer
            else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
        end
    end
    
    def destroy
        masign_out
        redirect_to root_path
    end
end
