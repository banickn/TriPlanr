class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :title
      t.text :description
      t.references :sport, foreign_key: true
      t.float :tss
      t.float :duration

      t.timestamps
    end
  end
end
