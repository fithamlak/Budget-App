class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, presence: true
  validates :categories, presence: true

  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses, dependent: :destroy

  scope :ordered, -> { order(created_at: :desc) } 
end
