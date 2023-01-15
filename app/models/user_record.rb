# frozen_string_literal: true

class UserRecord < ApplicationRecord
  belongs_to :calendar_record
  belongs_to :user

  validates_uniqueness_of :calendar_record_id, scope: :user_id

  def limit_valid?
    #debugger
    return unless CalendarRecord.find_by(id: calendar_record_id).limit    
    errors.add(:calendar_record_id, "limit exceeded") if UserRecord.where(calendar_record_id: calendar_record_id).length >= CalendarRecord.find_by(id: calendar_record_id).limit
  end

  validate :limit_valid?
end
