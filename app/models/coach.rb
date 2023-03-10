# frozen_string_literal: true

class Coach < ApplicationRecord
  belongs_to :act
  belongs_to :user, optional: true
  has_many :calendar_records, dependent: :destroy

  validates :name, presence: { message: 'не может быть пустым' }
  validates_uniqueness_of :name
  validates_uniqueness_of :user_id
  validates :name, format: { with: /\A([a-zа-яё]+(\s)?)+\z/i, message: 'должно быть строкой' }
end
