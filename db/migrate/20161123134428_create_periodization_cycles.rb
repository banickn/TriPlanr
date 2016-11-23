class CreatePeriodizationCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :periodization_cycles do |t|
      t.string :title
      t.string :kind
      t.float :goal_ctl_bike
      t.float :goal_ctl_run
      t.float :goal_ctl_swim
      t.integer :year_position
      t.references :periodization_year, foreign_key: true

      t.timestamps
    end
  end
end
