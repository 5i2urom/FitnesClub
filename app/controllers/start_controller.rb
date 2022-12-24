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
        rand_len=rand(len)
        CalendarRecord
        rec = coach.calendar_records.new()
        rec.club = clubs[rand_len]
        rec.save
        #clubs[rand_len].calendar_records.new()
        #coach.calendar_records.save
        #clubs[rand_len].calendar_records.save
      end
      #CalendarRecord.save
    end

  end
end
