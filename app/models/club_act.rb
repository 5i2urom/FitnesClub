class ClubAct < ApplicationRecord
  belongs_to :club
  belongs_to :service_act

  validates_uniqueness_of :club_id, scope: :service_act_id 
end
