class CreatePeriodizationYears < ActiveRecord::Migration[5.0]
  def change
    create_table :periodization_years do |t|
      t.string :title
      t.date :season_start
      t.date :season_end
      t.integer :start_ctl_bike
      t.integer :start_ctl_run
      t.integer :start_ctl_swim
      t.integer :goal_ctl_bike
      t.integer :goal_ctl_run
      t.integer :goal_ctl_swim
      t.integer :block_ratio
      t.integer :duration_base
      t.integer :duration_build
      t.integer :duration_taper
      t.timestamps
    end
  end
end
