class Subscription < ActiveRecord::Base
  attr_accessible :payed, :stage_id, :user_id
  belongs_to :users
  belongs_to :stages
end
