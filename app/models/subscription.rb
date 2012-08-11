class Subscription < ActiveRecord::Base
  attr_accessible :payed, :stage_id, :user_id
  belongs_to :user
  belongs_to :stage
end
