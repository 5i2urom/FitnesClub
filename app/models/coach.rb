class Coach < ApplicationRecord
    belongs_to :service_act

    validates_uniqueness_of :name
end
