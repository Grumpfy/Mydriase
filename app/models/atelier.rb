class Atelier < ActiveRecord::Base
  attr_accessible :stage_id, :title
  belongs_to :stage
  has_many :inscriptions
  validates :stage_id, :title, presence: true
  validates :title, uniqueness: { scope: :stage_id, 
    message: "Les ateliers doivent avoir un nom unique" }
  before_destroy :ensure_not_referenced_by_any_inscription
  default_scope order(:title)

  private

  def ensure_not_referenced_by_any_inscription
    if inscriptions.empty?
      return true
    else
      errors.add(:base, 'Il y a des inscrits dans cet atelier')
      return false
    end
  end
end
