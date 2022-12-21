class Coach < ApplicationRecord
    belongs_to :service_act
    has_many :calendar_records

    validates_uniqueness_of :name
end
