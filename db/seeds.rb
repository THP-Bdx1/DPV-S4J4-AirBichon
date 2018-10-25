# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
    city = City.create!(name: Faker::Pokemon.location)
end

40.times do
    dog = Dog.create!(name: Faker::Pokemon.name, city_id: Random.rand(1..5))
end

20.times do
    dogsitter = Dogsitter.create!(name: Faker::Lovecraft.deity, city_id: Random.rand(1..5))
end

70.times do
    loop do
        doggy = Dog.find_by(id: Random.rand(1..40))
        guy = Dogsitter.find_by(id: Random.rand(1..20))
        if doggy.city_id == guy.city_id
            stroll = Stroll.create(dog_id: doggy.id, dogsitter_id: guy.id)
            break
        end
    end
end
        