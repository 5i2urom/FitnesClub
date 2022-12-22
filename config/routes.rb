Rails.application.routes.draw do
  root 'start#show'

  get 'start/show' => 'start#show'

  get 'join' => 'join#show'
  # get 'join/pool' => 'join#pool', :as => 'pool'
  # get 'join/gym' => 'join#gym', :as => 'gym'
  # get 'join/group' => 'join#group', :as => 'group'
  # get 'join/games' => 'join#games', :as => 'games'

  get 'join/act' => 'join#act', :as => 'act'

  get 'join/service' => 'join#service', :as => 'service'


end
