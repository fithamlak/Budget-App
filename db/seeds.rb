User.destroy_all
user = User.create(
  name: 'Justice',
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password'
)

Category.destroy_all
category = Category.create!(name: 'Utilities', icon: 'Internet')
5.times do
  expense = Expense.new(name: Faker::Company.name, amount: rand(0.5..10.0), author: user, category_ids: [category.id])
  expense.save!
end

category = Category.create!(name: 'Books', icon: 'books')
5.times do
  expense = Expense.new(name: Faker::Book.title, amount: rand(0.5..10.0), author: user, category_ids: [category.id])
  expense.save!
end

category = Category.create!(name: 'Movies', icon: 'movies')
5.times do
  expense = Expense.new(name: Faker::Movie.title, amount: rand(0.5..10.0), author: user, category_ids: [category.id])
  expense.save!
end
