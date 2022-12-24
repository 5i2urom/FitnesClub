class ClubAct < ApplicationRecord
  belongs_to :club
  belongs_to :act

  validates_uniqueness_of :club_id, scope: :act_id 
end
