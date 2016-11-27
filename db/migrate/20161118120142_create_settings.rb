class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.integer :weight
      t.integer :ftp
      t.timestamps
    end
  end
end
