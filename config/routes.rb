DssScheduler::Application.routes.draw do
  resources :resources
  resources :reservations
  resources :resource_categories
  
  get '/admin', :controller => "admin", :action=> "index"
  get '/welcome', :controller => "application", :action => "welcome"
  get '/logout', :controller => "application", :action => "logout"
  root :to => 'application#welcome'
end
