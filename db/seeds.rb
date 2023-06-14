User.destroy_all
user = User.create(
  name: 'Justice',
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password'
)

Category.destroy_all
category = Category.create!(name: 'Utilities', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdeE_Awvws-1NPzEBfiULdhVInQFtmxfdgXV8BseWQjlLb49gkCLIsZFNlYbjDg0WrqGY&usqp=CAU')
5.times do
  expense = Expense.new(name: Faker::Company.name, amount: rand(0.5..10.0), author: user, category_ids: [category.id])
  expense.save!
end

category = Category.create!(name: 'Books', icon: 'https://i.etsystatic.com/16421349/r/il/99a0b1/3585638490/il_794xN.3585638490_tigl.jpg')
5.times do
  expense = Expense.new(name: Faker::Book.title, amount: rand(0.5..10.0), author: user, category_ids: [category.id])
  expense.save!
end

category = Category.create!(name: 'Movies', icon: 'https://cdn.digitbin.com/wp-content/uploads/Top-best-Android-Apps-to-watch-and-stream-free-movies-online.jpg')
5.times do
  expense = Expense.new(name: Faker::Movie.title, amount: rand(0.5..10.0), author: user, category_ids: [category.id])
  expense.save!
end
