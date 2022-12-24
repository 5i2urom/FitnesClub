class CalendarRecord < ApplicationRecord
    #belongs_to :service_act
    belongs_to :club
    belongs_to :coach
    
    #validates_presence_of :club_id, :coach_id, :start_time, :end_time
    #validates_uniqueness_of :club_id, :service_act_id, :coach_id, :date_start, :date_end
end
