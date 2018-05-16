class AddConditionToTravel < ActiveRecord::Migration[5.0]
	def change
		add_column :travels, :condition, :string
	end
end
