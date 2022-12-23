Rails.application.routes.draw do
  devise_for :users
  
  get 'user/profile'

  root 'start#show'

  get 'start/show' => 'start#show'

  get 'join' => 'join#show'#, :as => 'user_root'

  get 'join/act' => 'join#act', :as => 'act'

  get 'join/service' => 'join#service', :as => 'service'




end
