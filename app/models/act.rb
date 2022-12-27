class Act < ApplicationRecord
    has_many :club_acts, dependent: :destroy
    has_many :clubs, through: :clubs_acts
    has_many :coaches, dependent: :destroy
    belongs_to :service


    validates :activity, presence: { message: 'не может быть пустым' }
    validates_uniqueness_of :activity    
    validates :activity, format: {with: /\A([a-z]+(\s)?)+\z/i, message: 'должно быть строкой'}
end
