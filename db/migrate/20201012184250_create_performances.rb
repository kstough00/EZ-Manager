class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.integer :artist_id
      t.integer :stage_id
      t.integer :duration
      t.text :description

      t.timestamps
    end
  end
end
