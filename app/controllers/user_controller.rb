# frozen_string_literal: true

# user
class UserController < ApplicationController
  before_action :authenticate_user!

  def profile; end

  def rec_destroy
    @my_id = rec_destroy_params[:my_id]
    UserRecord.find_by(calendar_record_id: @my_id, user: current_user).destroy
  end

  private

  def rec_destroy_params
    params.permit(:my_id)
  end
end
