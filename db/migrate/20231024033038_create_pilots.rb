class CreatePilots < ActiveRecord::Migration[7.1]
  def change
    create_table :pilots do |t|
      t.string :name
      t.integer :age
      t.integer :credits
      t.text :location_planet

      t.timestamps
    end
  end
end
