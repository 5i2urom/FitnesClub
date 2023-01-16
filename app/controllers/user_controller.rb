# frozen_string_literal: true

# user
class UserController < ApplicationController
  before_action :authenticate_user!

  def profile
    @coach = Coach.find_by(user_id: current_user&.id)
    @employee = Employee.find_by(user_id: current_user&.id)
    case 
    when @coach.present?
      @status = t('profile.сoach')
    when @employee.present?
      @status = t('profile.employee')
    else
      @status = t('profile.student')
    end
  end

  def rec_destroy
    @my_id = rec_destroy_params[:my_id]
    UserRecord.find_by(calendar_record_id: @my_id, user: current_user).destroy
  end

  private

  def rec_destroy_params
    params.permit(:my_id)
  end
end
