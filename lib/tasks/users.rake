namespace :users do

  task fake: :environment do
    20.times do
      email = Faker::Internet.email
      password = Faker::Internet.password(8)
      User.create(email: email, password: password, password_confirmation: password)
    end
  end
end