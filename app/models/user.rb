class User < ApplicationRecord
  has_many :user_records, dependent: :destroy
  has_many :calendar_records, through: :user_records

  validates_presence_of :name, :email, :encrypted_password
  validates_uniqueness_of :email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
