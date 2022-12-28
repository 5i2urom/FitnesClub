class CalendarRecord < ApplicationRecord
    belongs_to :club
    belongs_to :coach
    has_many :user_records, dependent: :destroy
    has_many :users, through: :user_records
    
    validates :start_time, presence: { message: 'не может быть пустым' }
    validates :end_time, presence: { message: 'не может быть пустым' }

    validates :start_time, comparison: { equal_to: :end_time, message: 'не должны совпадать' }

    validates_uniqueness_of :club_id, scope: [:coach_id, :start_time, :end_time]
end
