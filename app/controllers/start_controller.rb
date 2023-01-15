# frozen_string_literal: true1

# start
class StartController < ApplicationController
  include StartHelper

  before_action :set_empty

  def show
    p Coach.find_by(user_id: current_user&.id)
    # Act.all.each do |act|
    #   clubs = Club.joins(club_acts: :act).where("acts.activity = ?", act.activity)
    #   len = clubs.length.clone
    #   coaches = act.coaches
    #   coaches.each do |coach|
    #     #from = '26-12-2022'
    #     #to = '31-12-2022'
    #     month = '-02-2023'

    #     avialable_days = (20..26).to_a
    #     first = avialable_days[rand(avialable_days.length)]
    #     avialable_days.delete(first)
    #     second = avialable_days[rand(avialable_days.length)]

    #     [first, second].each do |day|
    #       beg = %w[10:30 12:30 14:30]
    #       #finish = %w[12:30 14:30 16:30]
    #       beg.each do |beg_each|
    #         end_each = beg_each.clone
    #         end_each[1] = (end_each[1].to_i + 2).to_s
    #         rand_len=rand(len)
    #         rec = coach.calendar_records.new(start_time: Time.parse(day.to_s+month+' '+beg_each),
    #             end_time: Time.parse(day.to_s+month+' '+end_each))
    #         rec.club = clubs[rand_len]
    #         rec.save
    #       end
    #     end
    #   end
    # end
  end
end
