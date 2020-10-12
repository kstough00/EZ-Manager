class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string :artist
      t.string :stage

      t.timestamps
    end
  end
end
