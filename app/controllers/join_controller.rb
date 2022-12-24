class JoinController < ApplicationController
  include JoinHelper

  before_action :redirect_if_empty, except: [:show, :service]
  before_action :set_empty, only: :show
  before_action :before_service, only: :service
  before_action :before_act, only: [:act, :club]
  #before_action :before_club, only: :club
  before_action :before_calendar, only: :calendar

  before_action :authenticate_user!, only: [:club, :calendar]
 

  def show
    $record = Hash.new(4)
    p $record 
  end

  def service 
    $record[:service] = service_params[:service] if !$record&.has_key?(:service)
                                                              #если сервис уже записан, не перезаписывать 
    p '------------'                                                            
    p $record
  end

  def act
    $record[:activity] = act_params[:activity] if !$record&.has_key?(:activity)
    p $record
  end

  def club
    p $record
  end

  def calendar
    $record[:club] = club_params[:club] if !$record&.has_key?(:club)

    @data = CalendarRecord.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )

    p $record
  end

  def service_params
    params.permit(:service)
  end

  def act_params
    params.permit(:activity)
  end

  def club_params
    params.permit(:club)
  end
end
