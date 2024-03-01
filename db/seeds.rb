User.create!(name:  "Kedar Hegde",
             email: "kedar.hegde@andpad.co.jp",
             password:              "password123",
             password_confirmation: "password123",
             admin: true)

User.create!(name:  "ケダル へぐで",
             email: "kedar.hegde+001@andpad.co.jp",
             password:              "password123",
             password_confirmation: "password123")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password123"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

