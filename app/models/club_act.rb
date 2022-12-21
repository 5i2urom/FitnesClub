class ClubAct < ApplicationRecord
  belongs_to :club_id
  belongs_to :service_act_id
end
