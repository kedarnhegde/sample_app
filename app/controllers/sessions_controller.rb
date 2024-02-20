class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      if user.authenticate(params[:session][:password])
        puts "Success!"
      else
        flash[:danger] = "Incorrect password for '#{params[:session][:email].downcase}' Please try again!"
        render 'new'
      end
    else
      flash[:danger] = "Email / User doesn't exist. Please check the email ID you entered"
      render 'new'
    end
    # if user && user.authenticate(params[:session][:password])
    #   puts "Success!!"
    # else
    #   flash[:danger] = "Invalid email/password combination"
    #   render 'new'
    # end
  end

  def destroy
  end
end
