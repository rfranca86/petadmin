class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :client, foreign_key: true
      t.decimal :total
      t.timestamps
    end
  end
end
