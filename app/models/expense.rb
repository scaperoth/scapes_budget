class Expense < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  has_one :frequency
end
