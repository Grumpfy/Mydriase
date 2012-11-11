class Inscription < ActiveRecord::Base
  attr_accessible :adherent_id, :atelier_id, :atelier_notes, :remarques, :stage_id, :minor, :room, :housing_notes, :vegetarian, :food_notes
  validates :stage_id, :atelier_id, :adherent_id, presence: true
  validate :stage_and_atelier_match
  belongs_to :stage
  belongs_to :atelier
  belongs_to :adherent

  private

  def stage_and_atelier_match
    if stage_id != atelier.stage_id
      errors.add(:atelier_id, "attelier didn't belongs to the selected stage")
    end
  end
end
