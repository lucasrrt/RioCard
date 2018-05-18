class Vehicle < ApplicationRecord
	has_many :travels

	before_destroy do |vehicle|
		vehicle.travels.destroy_all
	end
end
