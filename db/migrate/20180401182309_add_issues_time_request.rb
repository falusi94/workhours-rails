class AddIssuesTimeRequest < ActiveRecord::Migration[5.0]
  def change
    change_table :issues do |t|
      t.boolean :done
      t.integer :estimated_time
    end
  end
end
