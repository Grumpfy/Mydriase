class Stage < ActiveRecord::Base
  attr_accessible :end, :start, :title
  has_many :subscriptions, dependent: :destroy
  has_many :ateliers, dependent: :destroy
end
