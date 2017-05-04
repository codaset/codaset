raise '*** DANGEROUS! Only to be run in development ***' unless Rails.env.development?

puts 'Seeding development DB'

puts '== Users... '
User.create! github_id: 4614,
             username: 'joelmoss',
             email: 'joel@developwithstyle.com'
(1..9).each do |i|
  User.create! github_id: 100 + i,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email
end

puts '== Organisations... '
(1..10).each do |i|
  Organisation.create! github_id: 600 + i,
                       username: Faker::Internet.user_name,
                       email: Faker::Internet.email
end

user_ids = User.all.pluck(:id)

puts '== Cards... '
User.each do |user|
  (1..(1..20).to_a.sample).each do |i|
    user.cards.create! title: Faker::Lorem.sentence,
                       description: Faker::Lorem.paragraphs.join("\n\n"),
                       creator: user_ids.sample
  end
end
Organisation.each do |org|
  (1..(1..20).to_a.sample).each do |i|
    org.cards.create! title: Faker::Lorem.sentence,
                      description: Faker::Lorem.paragraphs.join("\n\n"),
                      creator: user_ids.sample
  end
end
