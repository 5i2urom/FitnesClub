class Coach < ApplicationRecord
    belongs_to :act
    has_many :calendar_records, dependent: :destroy

    validates :name, presence: { message: 'не может быть пустым' }
    validates_uniqueness_of :name    
    validates :name, format: {with: /\A([a-z]+(\s)?)+\z/i, message: 'должно быть строкой'}
end
