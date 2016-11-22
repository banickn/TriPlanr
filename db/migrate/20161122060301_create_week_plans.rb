class CreateWeekPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :week_plans do |t|
      t.string :macro_period
      t.string :meso_period
      t.float :load_time
      t.integer :load_atl
      t.integer :load_ctl
      t.boolean :camp

      t.timestamps
    end
  end
end
