class AddIsStudentToUser < ActiveRecord::Migration[5.0]
	def change
		add_column :users, :isStudent, :boolean
	end
end
