class Adherent < ActiveRecord::Base
  attr_accessible :adresse, :code_postal, :mail, :nom, :portable, :prenom, :remarques, :tel, :ville
  validates :nom, :prenom, presence: true
  has_many :inscriptions
  before_destroy :ensure_not_referenced_by_any_inscription
  default_scope order(:nom)

  private
  
  def ensure_not_referenced_by_any_inscription
    if inscriptions.empty?
      return true
    else
      errors.add(:base, 'Cette personne a des inscriptions')
      return false
    end
  end
end
