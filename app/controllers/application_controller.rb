class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :set_current_user
  
  protect_from_forgery
  
  def welcome
    unless session[:cas_user].nil?
      redirect_to new_reservation_url
    end
  end
  
  def logout
    logger.info "#{session[:cas_user]}@#{request.remote_ip}: Logged out."
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
  
	def set_current_user
		Authorization.current_user = session[:cas_user]
		session[:cas_user]
	end
	
	def current_user
		Person.new
	end  
end