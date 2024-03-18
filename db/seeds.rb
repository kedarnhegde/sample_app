User.create!(name:  "Kedar Hegde",
             email: "kedar.hegde@andpad.co.jp",
             password:              "password123",
             password_confirmation: "password123",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "ケダル へぐで",
             email: "kedar.hegde+001@andpad.co.jp",
             password:              "password123",
             password_confirmation: "password123",
             activated: true,
             activated_at: Time.zone.now,
             locale: "ja")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password123"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
