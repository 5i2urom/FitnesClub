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
    @status = lambda do |user|
        coach = Coach.find_by(user_id: user)
        employee = Employee.find_by(user_id: user)
        case 
        when coach.present?
            status = t('profile.сoach')
        when @employee.present?
            status = t('profile.employee')
        else
            status = t('profile.student')
        end
        status    
    end
  end

    def reply
        @comp_id = reply_params[:comp_id]
        @reply = reply_params[:reply]
        Complaint.find_by(id: @comp_id).update(status: 1, response: @reply, employee_id: Employee.find_by(user_id: current_user.id).id)
    end

    def decline
        @comp_id = decline_params[:comp_id]
        Complaint.find_by(id: @comp_id).update(status: 2)        
    end

    def archive
        @status = lambda do |user|
            coach = Coach.find_by(user_id: user)
            employee = Employee.find_by(user_id: user)
            case 
            when coach.present?
                status = t('profile.сoach')
            when @employee.present?
                status = t('profile.employee')
            else
                status = t('profile.student')
            end
            status    
        end
    end

  private

  def new_params
    params.permit(:theme, :problem)
  end

  def decline_params
    params.permit(:comp_id)
  end

  def reply_params
    params.permit(:comp_id, :reply)
  end

  def not_employee
    redirect_to root_path if Employee.find_by(user_id: current_user&.id).nil?
  end

  def if_employee
    redirect_to root_path if Employee.find_by(user_id: current_user&.id).present?
  end
end

