require 'faker'

100.times do
  resto = Restaurant.new(
    name: Faker::Cannabis.cannabinoid,
    city:Faker::Address.city
    )
  resto.save
end
