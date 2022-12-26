class Service < ApplicationRecord
    has_many :acts

    validates_presence_of :service
    validates_uniqueness_of :service
end
