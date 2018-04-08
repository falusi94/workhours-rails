class User < ApplicationRecord
  has_secure_password
  has_many :record

  validates :id, uniqueness: true
  validates :username, uniqueness: true

  def editable?(user)
    user.admin? || user.id == id
  end

end
