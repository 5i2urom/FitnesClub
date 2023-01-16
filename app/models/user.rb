# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_records, dependent: :destroy
  has_many :calendar_records, through: :user_records
  has_one :coach
  has_one :employee
  has_many :complaints

  validates :name, presence: { message: 'не может быть пустым' }
  validates :name, format: { with: /\A([a-zа-яё0-9]+(\s)?)+\z/i, message: 'должно быть строкой' }
  # validates_uniqueness_of :email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
