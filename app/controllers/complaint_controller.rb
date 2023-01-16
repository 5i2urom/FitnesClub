class ComplaintController < ApplicationController
  before_action :authenticate_user!
  before_action :not_employee, only: %w[active archive]
  before_action :if_employee, only: %w[new history]

  def new
  end

  def add
    @theme = new_params[:theme]
    @problem = new_params[:problem]
    Complaint.create!(user: current_user, theme: @theme, message: @problem, status: 0)
    redirect_to complaint_history_path 
  end

  def history
  end

  def active
  end

  def archive
  end

  private

  def new_params
    params.permit(:theme, :problem)
  end

  def not_employee
    redirect_to root_path if Employee.find_by(user_id: current_user&.id).nil?
  end

  def if_employee
    redirect_to root_path if Employee.find_by(user_id: current_user&.id).present?
  end
end

