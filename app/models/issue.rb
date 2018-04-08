class Issue < ApplicationRecord
  belongs_to :project
  has_many :record

  validates :id, uniqueness: true
  validates :name, uniqueness: true

  def done?
    done || record.sum(:time) > estimated_time
  end
end
