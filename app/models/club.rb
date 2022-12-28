# frozen_string_literal: true

class Club < ApplicationRecord
  has_many :club_acts, dependent: :destroy
  has_many :acts, through: :clubs_acts
  has_many :calendar_records, dependent: :destroy

  validates :name, presence: { message: 'не может быть пустым' }
  validates :address, presence: { message: 'не может быть пустым' }
  validates_uniqueness_of :name
  validates_uniqueness_of :address
  validates :name, format: { with: /\A([a-zа-я]+(\s)?)+\z/i, message: 'должно быть строкой' }
  validates :address, format: { with: /[[:alnum:]]/, message: 'должно состоять из букв и цифр' }
end
