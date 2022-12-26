class JoinController < ApplicationController
  include JoinHelper

  before_action :redirect_if_empty, except: [:show, :service]
  before_action :set_empty, only: :show
  before_action :before_service, only: :service
  before_action :before_act, only: :act
  before_action :before_club, only: :club
  before_action :before_calendar, only: :calendar
  

  before_action :authenticate_user!, only: [:club, :calendar]
 

  def show
    #p $record 
  end

  def service
    p service_params[:service]
    p $record[:service]     
    $record[:service] = service_params[:service] if (!$record&.has_key?(:service) || service_params[:service]!=$record[:service])
                                                              #если сервис уже записан, не перезаписывать ------ перезаписать, если сервис сменился
   # p '------------'                                                            
    #p $record
  end

  def act
    $record[:activity] = act_params[:activity] if (!$record&.has_key?(:activity) || service_params[:activity]!=$record[:activity])
    #p $record
  end

  def club
    #p $record
    #p current_user.id
  end

  def calendar
    $record[:club] = club_params[:club] if !$record&.has_key?(:club)

    records = CalendarRecord.where(
      start_time: Time.now..Time.now.end_of_month.end_of_week
    )
    
    @records_need = []
    records.each do |record|
      @records_need.push(record) if record.club.name==$record[:club] && record.coach.act.activity==$record[:activity] 
    end
    @my_coaches = []
    @records_need.each { |r| @my_coaches.push(r.coach.name) unless @my_coaches.include? r.coach.name}

    p $record
  end

  def write
    @my_id = my_id_params[:my_id]
    @my_start = params[:my_start]
    @my_end = params[:my_end]
    new_r = CalendarRecord.find_by(id: @my_id).user_records.new(user: current_user)
    new_r.valid? ? new_r.save : flash[:alert] = "Вы уже записаны!"
  end

  private

  def service_params
    params.permit(:service)
  end

  def act_params
    params.permit(:activity)
  end

  def club_params
    params.permit(:club)
  end

  def my_id_params
    params.permit(:my_id)
  end
end
