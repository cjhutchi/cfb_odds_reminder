class CreateWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :weeks do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
