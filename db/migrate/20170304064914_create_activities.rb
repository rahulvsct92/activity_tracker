class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :duration
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
