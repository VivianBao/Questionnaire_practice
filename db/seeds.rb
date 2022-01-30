# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."
Questionnaire.destroy_all
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
  first_name: 'Vivian',
  last_name: 'Bow',
  email: 'vivian@lewagon.jp',
  password: '123456',
  team: team
)
puts "User #{user1.first_name} was created"

user2 = User.create!(
  first_name: 'John',
  last_name: 'Lemon',
  email: 'john@lewagon.jp',
  password: '123456',
  team: team
)
puts "User #{user2.first_name} was created"

questionnaire_new = Questionnaire.create(
  name: "Work Performance",
  reviewer: user1,
  reviewee: user2
)

puts "#{Questionnaire.all.count} questionnaire created"

require 'json'
file = File.read('db/category_hash.json')
categories_hash = JSON.parse(file)

categories_hash.each do |category, subhash|
  category_new = Category.create(name: category.to_s)
  subhash.each do |subcategory, question_traits|
    subcategory_new = Subcategory.create(
      name: subcategory.to_s,
      category: category_new
    )
    Question.create(
      question_text: question_traits['question'],
      questionnaire: questionnaire_new,
      subcategory: subcategory_new
    )
    Question.create(
      question_text: 'Which aspect do you think he/she can work on?',
      questionnaire: questionnaire_new,
      subcategory: subcategory_new
    )
    question_traits['traits'].each do |trait|
      Trait.create(
        name: trait,
        subcategory: subcategory_new
      )
    end
  end
end

puts "#{Category.all.count} categories created"
puts "#{Subcategory.all.count} subcategories created"
puts "#{Question.all.count} questions created"
puts "#{Trait.all.count} traits created"
