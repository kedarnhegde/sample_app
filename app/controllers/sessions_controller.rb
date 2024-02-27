class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      if user.authenticate(params[:session][:password])
        log_in user
        remember user
        redirect_to user
      else
        flash.now[:danger] = "Incorrect password for '#{params[:session][:email].downcase}' Please try again!"
        render 'new'
      end
    else
      flash.now[:danger] = "Email / User doesn't exist. Please check the email ID you entered"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
