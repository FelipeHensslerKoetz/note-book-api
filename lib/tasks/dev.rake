namespace :dev do
  desc 'Configure the development environment'
  task setup: :environment do
    100.times do |i|
      p "Generating Contact: #{i}"
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago,to: 18.years.ago)
      )
    end
    p 'Done!'
  end
end
