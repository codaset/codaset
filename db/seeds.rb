raise '*** DANGEROUS! Only to be run in development ***' unless Rails.env.development?

puts 'Seeding development DB'

puts '== Users... '
User.create! github_id: 4614,
             github_access_token: ENV.fetch('OCTOKIT_DEV_GITHUB_TOKEN', 'x' * 40),
             username: 'joelmoss',
             email: 'joel@developwithstyle.com'
(1..9).each do |i|
  User.create! github_id: 100 + i,
               github_access_token: 'x' * 40,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email
end

user_ids = User.all.pluck(:id)

puts '== Organisations... '
(1..10).each do |i|
  org = Organisation.create!(name: Faker::Company.name)
  (0..rand(0..20)).each do |i|
    org.cards.create! title: Faker::Lorem.sentence,
                      description: Faker::Lorem.paragraphs.join("\n\n"),
                      creator: user_ids.sample
                      # assignees: user_ids.sample(rand(0..3))
  end
end
