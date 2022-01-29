# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."
Company.destroy_all
Category.destroy_all
puts "Database cleared!"

company = Company.create!(name: "WorkEvalution")
puts "Company #{company.name} was created"

team = Team.new(name: "Team A")
team.company = company
team.save!
puts "Team #{team.name} was created"

user1 = User.create!(
  first_name: "Vivian",
  last_name: 'Bow',
  email: 'vivian@lewagon.jp',
  password: '123456',
  team: team
)
puts "User #{user1.first_name} was created"

user2 = User.create!(
  first_name: "John",
  last_name: 'Lemon',
  email: 'John@lewagon.jp',
  password: '123456',
  team: team
)
puts "User #{user2.first_name} was created"

require 'json'
file = File.read('db/category_hash.json')
categories_hash = JSON.parse(file)

categories_hash.each do |category, subhash|
  category_new = Category.create(name: category.to_s)
  subhash.each do |subcategory, trait_list|
    subcategory_new = Subcategory.create(
      name: subcategory.to_s,
      category: category_new
    )
    trait_list.each do |trait|
      Trait.create(
        name: trait,
        subcategory: subcategory_new
      )
    end
  end
end

puts "#{Category.all.count} categories created"
puts "#{Subcategory.all.count} subcategories created"
puts "#{Trait.all.count} traits created"
