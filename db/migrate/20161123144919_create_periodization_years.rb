class CreatePeriodizationYears < ActiveRecord::Migration[5.0]
  def change
    create_table :periodization_years do |t|
      t.string :title

      t.timestamps
    end
  end
end
