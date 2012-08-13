class Inscription < ActiveRecord::Base
  attr_accessible :adherent_id, :attelier_id, :remarques, :stage_id
end
