class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :rescuer_name
      t.integer :day_limit
      t.references :dog, foreign_key: true, index: true

      t.timestamps
    end
  end
end
