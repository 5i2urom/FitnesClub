# frozen_string_literal: true

Rails.application.routes.draw do
  get 'complaint/new'
  post 'complaint/add'
  get 'complaint/history'
  get 'complaint/active'
  get 'complaint/archive'
  post 'complaint/decline'
  post 'complaint/reply'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'user/profile'

  post 'user/rec_destroy' => 'user#rec_destroy', :as => 'rec_destroy'

  root 'start#show'

  get 'start/show' => 'start#show'

  get 'join' => 'join#show'

  get 'join/service' => 'join#service', :as => 'service'

  get 'join/act' => 'join#act', :as => 'act'

  get 'join/club' => 'join#club', :as => 'club'

  get 'join/calendar' => 'join#calendar', :as => 'calendar'

  post 'join/write' => 'join#write', :as => 'write'

  get 'coach/timetable'

  post 'coach/coach_rec_destroy' => 'coach#coach_rec_destroy', :as => 'coach_rec_destroy' 

end
