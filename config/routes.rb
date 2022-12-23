Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  get 'user/profile'

  root 'start#show'

  get 'start/show' => 'start#show'

  get 'join' => 'join#show'#, :as => 'user_root'
  
  get 'join/service' => 'join#service', :as => 'service'

  get 'join/act' => 'join#act', :as => 'act'

  get 'join/club' => 'join#club', :as => 'club'



end
