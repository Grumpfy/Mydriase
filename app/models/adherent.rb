class Adherent < ActiveRecord::Base
  attr_accessible :adresse, :code_postal, :mail, :nom, :portable, :prenom, :remarques, :tel, :ville
  validates :nom, :prenom, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, format: { with: VALID_EMAIL_REGEX }, allow_blank: true 
  validates :code_postal, numericality: {only_integer: true, greater_than: 0}, allow_blank: true
  VALID_PHONE_REGEX = /\A(\+{0,1}\d+)([\s\-]{0,1}\d+)*\z/i
  validates :tel, :portable, format: { with: VALID_PHONE_REGEX }, allow_blank: true
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
