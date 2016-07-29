4.times do |x|
  User.create(full_name: Faker::Name.name, email: Faker::Internet.email, password: '123', description: Faker::Lorem.paragraph, phone_number: '+15555555555')
end

4.times do |x|
  Listing.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, location: Faker::Address.country, price: rand(300..1000), manager_id: rand(1..4))
end

6.times do |x|
  Reference.create(receiver_id: rand(1..4), author_id: rand(1..4), reference: Faker::Lorem.paragraph)
end

6.times do |x|
  Response.create(listing_id: rand(1..4), author_id: rand(1..4), response: Faker::Lorem.paragraph)
end
