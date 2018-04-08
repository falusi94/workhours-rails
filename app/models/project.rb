class Project < ApplicationRecord
  has_many :issue

  validates :id, uniqueness: true
  validates :name, uniqueness: true
end
