class CreateBudgetsIncomes < ActiveRecord::Migration
  def change
    create_table :budgets_incomes do |t|
      t.belongs_to :budget, index: true
      t.belongs_to :income, index: true
    end
  end
end
