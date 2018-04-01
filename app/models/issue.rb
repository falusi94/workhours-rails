class Issue < ApplicationRecord
  belongs_to :project
  has_many :record

  def done?
    done || record.sum(:time) > estimated_time
  end
end
