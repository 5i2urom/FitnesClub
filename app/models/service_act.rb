class ServiceAct < ApplicationRecord
    has_many :club_acts
    has_many :clubs, through: :clubs_acts
    has_many :coaches
    #has_many :calendar_records

    validates_uniqueness_of :activity 
end
