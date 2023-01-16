class CoachController < ApplicationController

  before_action :authenticate_user!
  before_action :not_coach

  def timetable
    @coach = Coach.find_by(user_id: current_user&.id)
    @clubs = Club.joins(club_acts: :act).where("acts.id = ?", @coach.act_id)

    records = CalendarRecord.where(
      start_time: Time.now..(Time.now+1.month).end_of_month.end_of_week
    )

    @records_need = records.where(coach_id: Coach.find_by(user_id: current_user&.id).id)
  end

  def coach_rec_destroy
    @calendar_id = coach_rec_destroy_params[:calendar_id].to_i
    @user_id = coach_rec_destroy_params[:user_id]   
    UserRecord.find_by(calendar_record_id: @calendar_id, user: @user_id).destroy
    @users_length = User.joins(user_records: :calendar_record).where("calendar_records.id= ?", @calendar_id).length
  end

  private

  def coach_rec_destroy_params
    params.permit(:user_id, :calendar_id, :users_length)
  end

  def not_coach
    redirect_to root_path if Coach.find_by(user_id: current_user&.id).nil?
  end
end
