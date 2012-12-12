class Operation < ActiveRecord::Base
  attr_accessible :inscription_id, :description, :method, :price
  validates :description, :method, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.00}
  belongs_to :inscription
  validates_associated :inscription

end
