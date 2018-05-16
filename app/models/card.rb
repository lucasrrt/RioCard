class Card < ApplicationRecord
	belongs_to :user, optional:true

	has_many :recharges
	has_many :travels

	validate :user_existence

	def user_existence
		if self.user_id
			return false if User.find_by_id(self.user_id).nil?
		end
	end

	def balance
		recharges = self.recharges
		travels = self.travels
		balance = 0
		recharges.each{ |recharge| balance = balance + recharge.value }
		travels.each{ |travel| balance = balance - travel.vehicle.price if travel.condition != "freePass"}
		return balance
	end
end
