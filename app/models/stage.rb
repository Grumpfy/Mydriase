class Stage < ActiveRecord::Base
  attr_accessible :end, :start, :title
  has_many :inscriptions
  has_many :ateliers, dependent: :destroy
  validates :end, :start, :title, presence: true
  validates :title, uniqueness: true
  before_destroy :ensure_not_referenced_by_any_inscription

  private

  def ensure_not_referenced_by_any_inscription
    if inscriptions.empty?
      return true
    else
      errors.add(:base, 'Il y a des inscrits dans ce stage')
      return false
    end
  end
end
