class User < ActiveRecord::Base
  attr_accessible :admin, :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true 
  has_secure_password
  after_destroy :ensure_an_admin_remains

  private

  def ensure_an_admin_remains
    if User.where(admin: true).count().zero?
      raise "Impossible de supprimer le dernier administrateur"
    end 
  end

end
