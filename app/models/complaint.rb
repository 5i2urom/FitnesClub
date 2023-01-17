class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :employee, optional: true

  enum status: [:process, :success, :fail]

  validates :message, presence: { message: 'не может быть пустым' }
  validates :status, presence: { message: 'не может быть пустым' }
  validates :theme, presence: { message: 'не может быть пустым' }

  def dif_valid?
    errors.add(:user_id, "are the same") if Employee.find_by(user_id: user_id)
    p Employee.find_by(user_id: user_id)
  end

  validate :dif_valid?
end
