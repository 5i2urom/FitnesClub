class StartController < ApplicationController
  include StartHelper
  
  before_action :set_empty

  def show
    
    # Service.create!(name: "Бассейн")
    # Service.create!(name: "Тренажёрный зал")
    # Service.create!(name: "Игры")
    # Service.create!(name: "Групповые тренировки")

    # Clubs.all.each do |club|
    #   @rec = club.calendar_records.new()
    # end

    # ServiceAct.all.each do |service_act|
    #   clubs = Club.joins(club_acts: :service_act).where("service_acts.activity = ?", service_act.activity)
    #   len = clubs.length.clone
    #   coaches = service_act.coaches
    #   coaches.each do |coach|
    #     #from = '26-12-2022'
    #     #to = '31-12-2022'
    #     dec = '-12-2022'
    #     (26..31).each do |i|
    #       beg = %w[10:30 12:30 14:30]
    #       #finish = %w[12:30 14:30 16:30]
    #       beg.each do |beg_each|
    #         end_each = beg_each.clone
    #         end_each[1] = (end_each[1].to_i + 2).to_s
    #         rand_len=rand(len)
    #         rec = coach.calendar_records.new(start_time: Time.parse(i.to_s+dec+' '+beg_each),
    #          end_time: Time.parse(i.to_s+dec+' '+end_each))
    #         rec.club = clubs[rand_len]
    #         rec.save
    #       end
    #     end
    #   end
    # end
  end
end
