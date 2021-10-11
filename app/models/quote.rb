class Quote < ApplicationRecord
	validates :title, presence: true
	has_many :ratings

	def average_rating
		self.ratings.average(:stars).to_f.round(1)
	end
end
