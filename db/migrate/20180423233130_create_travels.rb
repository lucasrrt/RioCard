class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.references :vehicle, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
