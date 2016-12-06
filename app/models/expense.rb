class Expense < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
end
