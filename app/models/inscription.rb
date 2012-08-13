class Inscription < ActiveRecord::Base
  attr_accessible :adherent_id, :atelier_id, :remarques, :stage_id
  belongs_to :stage
  belongs_to :atelier
  belongs_to :adherent
end
