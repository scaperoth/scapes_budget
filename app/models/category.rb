class Category < ActiveRecord::Base
  has_and_belongs_to_many :incomes
  has_and_belongs_to_many :expenses
end
