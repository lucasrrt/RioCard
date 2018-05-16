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

	def second_valid_travel?
		past_travel = Travel.where(card_id: card_id).order(:created_at).last
		if past_travel
			return ((past_travel.condition == "valid") and (Time.now.utc - past_travel.created_at < 2.5*60*60))
		else
			return false
		end
	end
end
