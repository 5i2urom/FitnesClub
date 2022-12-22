class JoinController < ApplicationController
  include JoinHelper

  before_action :show_cond, only: :show
  before_action :before_service, only: :service
  before_action :act_cond, only: :act

  def show 
  end

  def service
    $record ||= CalendarRecord.new(service: service_params[:service]) # запись поля после выбора услуги
    p $record
  end

  def act
    $record.activity = act_params[:activity]
  end

  def service_params
    params.permit(:service)
  end

  def act_params
    params.permit(:activity)
  end
end
