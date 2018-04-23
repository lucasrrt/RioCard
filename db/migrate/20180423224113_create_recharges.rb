class CreateRecharges < ActiveRecord::Migration[5.0]
	def change
		create_table :recharges do |t|
			t.references :card, foreign_key: true
			t.money :value

			t.timestamps
		end
	end
end
