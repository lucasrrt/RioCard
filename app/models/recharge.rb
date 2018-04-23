class Recharge < ApplicationRecord
	belongs_to :card

	validate :card_existence

	def card_existence
		return false if Card.find_by_id(self.card_id).nil?
	end
end
