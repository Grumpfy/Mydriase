class Inscription < ActiveRecord::Base
  attr_accessible :adherent_id, :atelier_id, :atelier_notes, :remarques, :stage_id, :minor, :room, :housing_notes, :vegetarian, :food_notes, :conf1, :conf2, :bill_requested, :bill_delivered, :hidden
  validates :stage_id, :atelier_id, :adherent_id, presence: true
  validate :stage_and_atelier_match
  belongs_to :stage
  belongs_to :atelier
  belongs_to :adherent
  scope :by_name, joins(:adherent).order("adherents.nom") 
  scope :pending_conf1, where("conf1 = ? and conf2 = ?", false, false) 
  scope :pending_conf2, where("conf1 = ? AND conf2 = ?", true, false)
  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  has_many :billings, dependent: :destroy
  accepts_nested_attributes_for :billings
  attr_accessible :billings_attributes
  has_many :operations, dependent: :destroy
  accepts_nested_attributes_for :operations
  attr_accessible :operations_attributes

  private

  def stage_and_atelier_match
    if stage_id != atelier.stage_id
      errors.add(:atelier_id, "attelier didn't belongs to the selected stage")
    end
  end
end
