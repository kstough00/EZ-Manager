class CreateStages < ActiveRecord::Migration[6.0]
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :performances
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
