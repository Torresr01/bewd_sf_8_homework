class Movie < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 2}
	validates :description, presence: true, length: { minimum: 10}
	validates :year_released, presence: true

	def self.search(query)
		if query 
			Movie.where('title LIKE :search', {search: "%#{query}%"})
		else
			Movie.all
		end
	end

	def search(query)
	end
end
