class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.date :season_start
      t.date :season_end
      t.integer :goal_ctl_bike_min
      t.integer :goal_ctl_bike_max
      t.integer :goal_ctl_run_min
      t.integer :goal_ctl_run_max

      t.timestamps
    end
  end
end
