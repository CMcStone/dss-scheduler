class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter {|contr| Authorization.current_user = contr.current_user}

  #before_filter :set_current_user
  protect_from_forgery
#	def set_current_user
#		Authorization.current_user = session[:cas_user]
#		session[:cas_user]
#	end
	
	def current_user
		Person.new
	end  
end