class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.integer :weight
      t.integer :ftp
      t.integer :start_ctl_swim
      t.integer :start_ctl_bike
      t.integer :start_ctl_run
      t.timestamps
    end
  end
end
