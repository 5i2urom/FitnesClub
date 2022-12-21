class ClubAct < ApplicationRecord
  belongs_to :club_id
  belongs_to :service_act_id

  validates_uniqueness_of :club_id, scope: :service_act_id 
end
