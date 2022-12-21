class ServiceAct < ApplicationRecord
    has_many :club_acts
    has_many :clubs, through: :clubs_acts
    has_many :coaches
end
