require 'rails_helper'

describe Expense, type: :model do
  user = User.create!(name: 'Justice')
  it 'is valid with a name, amount, and author' do
    expense = Expense.new(name: 'Cheeseburger', amount: '3.99', author: user)
    expect(expense).to be_valid
  end

  it 'is not valid without a name' do
    expense = Expense.new(name: '', amount: '3.99', author: user)
    expect(expense).to_not be_valid
  end

  it 'is not valid without a amount' do
    expense = Expense.new(name: 'Cheeseburger', amount: '', author: user)
    expect(expense).to_not be_valid
  end

  it 'is not valid without an author' do
    expense = Expense.new(name: 'Cheeseburger', amount: '2.99', author_id: '')
    expect(expense).to_not be_valid
  end
end