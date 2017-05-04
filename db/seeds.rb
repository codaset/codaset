raise '*** DANGEROUS! Only to be run in development ***' unless Rails.env.development?

puts 'Seeding development DB'

print '== Users... '
User.create! github_id: 4614,
             username: 'joelmoss',
             email: 'joel@developwithstyle.com'
(1..9).each do |i|
  User.create! github_id: 100 + i,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email
end
puts "(#{User.count})"

print '== Cards... '
User.each do |u|
  (1..(1..20).to_a.sample).each do |i|
    Card.create! title: Faker::Lorem.sentence,
                 description: Faker::Lorem.paragraphs
  end
end
puts "(#{Card.count})"