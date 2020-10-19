
user_1 = User.create(email: "donald.trump@moviio.io")
user_2 = User.create(email: "bruce.willies@moviio.io")

# Seed Movies
5.times do
	Movie.create(plot: Faker::Movie.quote, title: Faker::Movie.title)
end

# Seed Seasons
2.times do 
	season = Season.create(plot: "plot ", title: Faker::Movie.title)
end


# Seed Episodes
5.times { |n|  
	Episode.create!(title: "episode_#{n}", plot: "plot_#{n}", season_id: Season.first.id, number: n)

	}
