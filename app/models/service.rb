class Service < ApplicationRecord
    has_many :acts, dependent: :destroy

    validates :name, presence: { message: 'не может быть пустым' }
    validates_uniqueness_of :name    
    validates :name, format: {with: /\A([a-z]+(\s)?)+\z/i, message: 'должно быть строкой'}
end
