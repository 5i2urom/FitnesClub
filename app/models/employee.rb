class Employee < ApplicationRecord
  belongs_to :user, optional: true
  has_many :complaints

  validates_uniqueness_of :user_id
end
