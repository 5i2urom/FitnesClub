class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :employee, optional: true

  enum status: [:process, :success, :fail]
  
  validates :user_id, comparison: { other_than: :employee_id } 
end
