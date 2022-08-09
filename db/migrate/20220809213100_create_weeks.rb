class CreateWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :weeks do |t|
      t.date :end_date
      t.integer :number

      t.timestamps
    end
  end
end
