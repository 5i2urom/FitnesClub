Rails.application.routes.draw do
  root 'start#show'

  get 'start/show' => 'start#show'

  get 'service' => 'service#show'
  get 'service/pool' => 'service#pool'
  get 'service/gym' => 'service#gym'


end
