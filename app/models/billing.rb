class Billing < ActiveRecord::Base
  attr_accessible :inscription_id, :description, :price
  validates :description, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :inscription, inverse_of: :billings
  validates_presence_of :inscription

end
