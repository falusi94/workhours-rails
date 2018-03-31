class User < ApplicationRecord
  has_secure_password

  def editable?(user)
    user.admin? || user.id == id
  end

end
