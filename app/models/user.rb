class User < ApplicationRecord
	has_many :cards

	before_destroy do |user|
		user.cards.each{|card| card.update user_id: nil}
	end

	def age
		now = Time.now.to_date
		return now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month and now.day >= birthdate.day))? 0:1)
	end

	def elderly?
		return age >= 65
	end

	def hasFreePass?
		#TODO complicated conditions for students
		return (elderly? or (is_student and Time.now.on_weekday?))
	end
end
