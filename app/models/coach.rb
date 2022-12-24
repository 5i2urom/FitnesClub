class Coach < ApplicationRecord
    belongs_to :act
    has_many :calendar_records, dependent: :destroy

    validates_uniqueness_of :name
end
