class EmailMailer < ActionMailer::Base
    default :from => "share@itemnation.com"
    def email_send(email)
        @email = email
        @user = User.where(:id => @email.user_id)
        @user = @user.pluck(:name)
        @user = @user[0]
        
        mail(:to => @email.recipient, :subject => "#{@user} sends you a message from ItemNation")
    end
end
