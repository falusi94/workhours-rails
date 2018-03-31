class Record < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  def editable?(user)
    user.admin? || user.id == user_id
  end
end
