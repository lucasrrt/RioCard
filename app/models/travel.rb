class Travel < ApplicationRecord
	belongs_to :vehicle
	belongs_to :card

	validate :vehicle_existence, :card_existence

	def vehicle_existence
		return false if Vehicle.find_by_id(self.vehicle_id).nil?
	end

	def card_existence
		return false if Card.find_by_id(self.card_id).nil?
	end
end
