Rails.application.routes.draw do
  root 'start#show'

  get 'start/show' => 'start#show'

  get 'service' => 'service#show'
  get 'service/pool' => 'service#pool', :as => 'pool'
  get 'service/gym' => 'service#gym', :as => 'gym'


  get 'service/pool/acts' => 'service#pool_acts', :as => 'pool_acts'


end
