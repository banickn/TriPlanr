class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.date :date
      t.string :title
      t.text :description
      t.string :priority

      t.timestamps
    end
  end
end
