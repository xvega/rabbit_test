class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name, index: true
      t.integer :age
      t.integer :weight
      t.datetime :reservation_date
      t.references :breed, foreign_key: true, index: true

      t.timestamps
    end
  end
end
