class CreateScheduleStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_statuses do |t|
      t.references :service, foreign_key: true
      t.references :schedule, foreign_key: true
      t.integer :status
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
