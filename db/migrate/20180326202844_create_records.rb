class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :issue, foreign_key: true
      t.date :date
      t.integer :time

      t.timestamps
    end
  end
end
