class CreatePeriodizationYears < ActiveRecord::Migration[5.0]
  def change
    create_table :periodization_years do |t|
      t.string :title
      t.date :season_start
      t.date :season_end
      t.integer :goal_ctl_bike
      t.integer :goal_ctl_run
      t.integer :goal_ctl_swim
      t.timestamps
    end
  end
end
