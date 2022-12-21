class Club < ApplicationRecord
    has_many :club_acts
    has_many :service_acts, through: :clubs_acts
    has_many :calendar_records

    validates_uniqueness_of :name
    validates_uniqueness_of :address
end
