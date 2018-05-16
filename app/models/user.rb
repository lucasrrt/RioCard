class User < ApplicationRecord
	has_many :cards

	def age
		now = Time.now.to_date
		return now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month and now.day >= birthdate.day))? 0:1)
	end

	def hasFreePass?
		#TODO complicated conditions for students
		return (age > 65 or isStudent)
	end
end
