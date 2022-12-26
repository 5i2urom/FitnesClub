class Club < ApplicationRecord
    has_many :club_acts
    has_many :acts, through: :clubs_acts
    has_many :calendar_records, dependent: :destroy

    validates_presence_of :name, :address
    validates_uniqueness_of :name
    validates_uniqueness_of :address
end
