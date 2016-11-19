class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.date :date
      t.string :title
      t.float :duration
      t.float :power
      t.float :speed
      t.float :distance
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
