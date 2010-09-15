ActionController::Routing::Routes.draw do |map|
  map.resources :galleries

  map.resources :presses

  map.resources :user_sessions

  map.resources :users

  map.home '', :controller => 'site', :action => 'index'

  map.login "login", :controller => "user_sessions", :action => "new"

  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.result 'result', :controller => 'site', :action => 'result'

  map.games 'games', :controller => 'site', :action => 'games'

  map.faq 'faq', :controller => 'site', :action => 'faq'

  map.learn 'learn', :controller => 'site', :action => 'learn'

  map.play 'play', :controller => 'site', :action => 'play'

  map.register 'register', :controller => 'site', :action => 'register'

  map.contact 'contact', :controller => 'site', :action => 'contact'


  map.connect 'profile/:username', :controller => 'profile', :action => 'show'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

