class Vehicle < ApplicationRecord
	has_many :travels

	before_destroy do |vehicle|
		vehicle.travels.destroy_all
	end

	def translated_name
		return kind=="bus"?"Ônibus":(kind=="subway"?"Metrô":"Trem")
	end
end
