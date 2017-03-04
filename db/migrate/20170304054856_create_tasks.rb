class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :planned_hours
      t.integer :status

      t.timestamps
    end
  end
end
