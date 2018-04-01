class User < ApplicationRecord
  has_secure_password
  has_many :record

  def editable?(user)
    user.admin? || user.id == id
  end

end
