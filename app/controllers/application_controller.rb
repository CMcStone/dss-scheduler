class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  protect_from_forgery

	def current_user
		Person.new
	end  

	#def set_current_user
	#	Authorization.current_user = session[:cas_user]
		#session[:cas_user]
	#end
end