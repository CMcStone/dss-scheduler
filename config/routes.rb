DssScheduler::Application.routes.draw do
  resources :resources
  resources :reservations

  get '/welcome', :controller => "application", :action => "welcome"
  get '/logout', :controller => "application", :action => "logout"
  root :to => 'application#welcome'
end
