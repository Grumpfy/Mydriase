class Operation < ActiveRecord::Base
  attr_accessible :inscription_id, :description, :method, :price
  validates :method, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :inscription, inverse_of: :operations
  validates_presence_of :inscription

end
