class ResessionsController < ApplicationController
    def new
    end
    
    def create
        retailer = Retailer.find_by_email(params[:resession][:email].downcase)
        if retailer && retailer.authenticate(params[:resession][:password])
            resign_in retailer
            redirect_to retailer
            else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
        end
    end
    
    def destroy
        resign_out
        redirect_to root_path
    end
end
