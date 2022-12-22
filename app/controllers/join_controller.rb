class JoinController < ApplicationController
  include JoinHelper

  before_action :before_show, only: :show
  before_action :before_service, only: :service
  before_action :before_act, only: :act
  before_action :redirect_if_empty, except: [:show, :service]

  def show
    $record = Hash.new(4)
    p $record 
  end

  def service 
    $record[:service] = service_params[:service] if not $record.has_key?(:service) # если пришел спереди, не перезаписывать
    p $record
  end

  def act
    $record[:activity] = act_params[:activity] if not $record.has_key?(:activity)
    p $record
  end

  def service_params
    params.permit(:service)
  end

  def act_params
    params.permit(:activity)
  end
end
