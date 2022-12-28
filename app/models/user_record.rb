# frozen_string_literal: true

class UserRecord < ApplicationRecord
  belongs_to :calendar_record
  belongs_to :user

  validates_uniqueness_of :calendar_record_id, scope: :user_id
end
