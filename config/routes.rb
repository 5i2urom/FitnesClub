Rails.application.routes.draw do
  root 'start#show'

  get 'start/show' => 'start#show'

  get 'service' => 'service#show'
  get 'service/pool' => 'service#pool', :as => 'pool'
  get 'service/gym' => 'service#gym', :as => 'gym'
  get 'service/group' => 'service#group', :as => 'group'
  get 'service/games' => 'service#games', :as => 'games'

  get 'service/acts' => 'service#acts', :as => 'acts'

  get 'service/act' => 'service#act', :as => 'act'


end
