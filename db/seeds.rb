require 'faker'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating 100 fake movies...'
100.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    plot: Faker::Lorem.paragraph
  )
  movie.save!
end
puts 'Finished!'
