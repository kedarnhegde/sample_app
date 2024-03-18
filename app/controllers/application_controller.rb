class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  around_action :switch_locale

  def switch_locale(&action)
    locale = current_user&.locale || I18n.default_locale
    I18n.with_locale(locale, &action)
  end


  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log-in before accessing this page!"
        redirect_to login_url
      end
    end
end
