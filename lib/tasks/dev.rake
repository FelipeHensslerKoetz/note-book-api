namespace :dev do
  desc 'Configure the development environment'
  task setup: :environment do
    puts 'Genearating Kinds:'
    kinds = %w[Friend Comercial Known]

    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    puts 'Generating contacts'

    kinds = Kind.all

    100.times do |i|
      puts "Generating Contact - #{i}"
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: kinds.sample
      )
    end

    puts 'Contacts were generated!'

    puts 'Generating contacts'

    Contact.all.each do |contact|
      puts "Generating phone(s)"
      Random.rand(5).times { |_i| Phone.create!(number: Faker::PhoneNumber.cell_phone, contact:) }
    end

    puts 'Phones were generated!'
  end
end
