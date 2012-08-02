class User < ActiveRecord::Base
  attr_accessible :address, :first_name, :last_name, :photo_url
  has_many :subscriptions
end
