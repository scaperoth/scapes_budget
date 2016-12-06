class Budget < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :expenses
  has_and_belongs_to_many :incomes
  has_many :incomes
  has_many :expenses
end
