class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.date :season_start
      t.date :season_end

      t.timestamps
    end
  end
end
