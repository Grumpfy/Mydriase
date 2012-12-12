class Billing < ActiveRecord::Base
  attr_accessible :inscription_id, :description, :price
  validates :description, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :inscription
  validates_associated :inscription

end
