User.create!(name:  "Trong",
             email: "trong@gmail.com",
             password:              "111111",
             password_confirmation: "111111")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end