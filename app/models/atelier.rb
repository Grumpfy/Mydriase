class Atelier < ActiveRecord::Base
  attr_accessible :stage_id, :title
  belongs_to :stage
end
