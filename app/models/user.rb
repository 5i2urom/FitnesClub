class User < ApplicationRecord
  has_many :user_records, dependent: :destroy
  has_many :calendar_records, through: :user_records

  validates :name, presence: { message: 'не может быть пустым' }
  validates :name, format: {with: /\A([a-zа-я]+(\s)?)+\z/i, message: 'должно быть строкой'}
  # validates_uniqueness_of :email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
