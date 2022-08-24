class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.references :away_team, null: false, foreign_key: { to_table: :teams }

      t.datetime :commence_time, null: false

      t.string :home_team_points, null: false
      t.string :away_team_points, null: false

      t.references :week, null: :false

      t.timestamps
    end
  end
end
