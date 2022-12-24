class StartController < ApplicationController
  include StartHelper
  
  before_action :set_empty

  def show
    # Clubs.all.each do |club|
    #   @rec = club.calendar_records.new()
    # end

    ServiceAct.all.each do |service_act|
      clubs = Club.joins(club_acts: :service_act).where("service_acts.activity = ?", service_act.activity)
      len = clubs.length.clone
      coaches = service_act.coaches
      coaches.each do |coach|
        from = '26-12-2022'
        to = '31-12-2022'
        (26..31).each do |i|
          rand_len=rand(len)
          rec = coach.calendar_records.new(start_time: )
          rec.club = clubs[rand_len]
          rec.save
        end
      end
    end

  end
end
