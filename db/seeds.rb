require 'faker'

puts 'Cleaning database...'
Movie.destroy_all
Season.destroy_all
Episode.destroy_all
User.destroy_all

puts 'Creating 50 fake movies...'
50.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    plot: Faker::Lorem.paragraph
  )
  movie.save!
end
puts 'Finished!'

puts 'Creating 100 fake seasons...'
50.times do
  season = Season.new(
    title: Faker::Book.title,
    plot: Faker::Lorem.paragraph,
    season_number: rand(1..10)
  )
  season.save!
end
puts 'Finished!'

puts 'Creating 10 fake episodes for each season...'
seasons = Season.all
seasons.each do |season|
  episode_number = 1
  10.times do
    episode = Episode.new(
      title: Faker::Books::CultureSeries.book,
      plot: Faker::Lorem.paragraph,
      episode_number: episode_number,
      season_id: season.id
    )
    episode.save!
    episode_number += 1
  end
end
puts 'Finished!'

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
end
puts 'Finished!'
