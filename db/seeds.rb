password = Faker::Internet.password(6)

5.times do
   User.create!(
     username: Faker::Name.first_name+"12345",
     email: Faker::Internet.email,
     password: password,
     password_confirmation: password,
     confirmed_at: Faker::Date.backward(120)
     )
 end

testuser = User.create!(
     username: "Aprilmae",
     email: "april@mae.com",
     password: "ffffff",
     password_confirmation: "ffffff",
     confirmed_at: Faker::Date.backward(120)
     )
     testuser.skip_confirmation!
     testuser.save!

 users = User.all


 100.times do
   item = Item.create!(
   user: users.sample,
   name: "Read "+ Faker::Book.title
   )
   item.update_attribute(:created_at, rand(10.minutes .. 120.days).ago)
 end

 events = Item.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Item.count} todo items created"
