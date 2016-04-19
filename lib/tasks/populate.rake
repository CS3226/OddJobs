namespace :db do
  desc "Erase and fill database"

  NUM_CATEGORIES = 10
  NUM_USERS = 50
  NUM_LISTINGS = 100
  STDOUT.sync = true

  task :populate => :environment do
    puts "...clearing all categories, users and listings"
    [Category, User, Listing].each(&:delete_all)

    NUM_CATEGORIES.times do |n|
      print "\r...generating #{n+1}/#{NUM_CATEGORIES} categories"
      STDOUT.flush
      Category.create(
        :name => Faker::Lorem.word,
        :desc => '',
        :id => n
      )
    end
    puts ''

    NUM_USERS.times do |n|
      print "\r...generating #{n+1}/#{NUM_USERS} users"
      User.create(
        :name => Faker::Name.name,
        :email => "#{n+1}@u.nus.edu",
        :password => 'password',
        :password_confirmation => 'password',
        :id => n
      )
    end
    puts ''

    NUM_LISTINGS.times do |n|
      print "\r...generating #{n+1}/#{NUM_LISTINGS} listings"
      num_paragraphs = rand(1..3)
      Listing.create(
        :title => Faker::Lorem.sentence,
        :description => Faker::Lorem.paragraphs(num_paragraphs).join("\n"),
        :remuneration => Faker::Lorem.words(rand(1..7)).join(' '),
        :poster_id => Faker::Number.between(0, NUM_USERS-1),
        :category_id => Faker::Number.between(0, NUM_CATEGORIES-1),
        :id => n
      )
    end
    puts ''
  end
end
