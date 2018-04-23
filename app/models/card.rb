class Card < ApplicationRecord
	belongs_to :user

	has_many :recharges

	validate :user_existence

	def user_existence
		if self.user_id
			return false if User.find_by_id(self.user_id).nil?
		end
	end

	def balance
		recharges = Recharge.where(card_id: self.id)
		balance = 0
		recharges.each{|recharge| balance = balance + recharge.value}
		return balance
	end
end
