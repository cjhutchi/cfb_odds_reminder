class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :school, null: false
      t.string :mascot
      t.string :alt_name_1
      t.string :alt_name_2
      t.string :alt_name_3

      t.timestamps
    end
  end
end
