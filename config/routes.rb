Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  get 'user/profile'

  root 'start#show'

  get 'start/show' => 'start#show'

  # resources :calendar_records, only: show do
  #   resources :service_acts, only: show do
  #     resources :clubs, only: show
  #   end
  # end  

  # get 'calendar_record' => 'calendar_record#show'#, :as => 'user_root'
  
  # get 'calendar_record/service' => 'calendar_record#service', :as => 'service'

  # get 'calendar_record/act' => 'calendar_record#act', :as => 'act'

  # get 'calendar_record/club' => 'calendar_record#club', :as => 'club'

  # get 'calendar_record/calendar' => 'calendar_record#calendar', :as => 'calendar'



end
