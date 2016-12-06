class CreateBudgetsExpenses < ActiveRecord::Migration
  def change
    create_table :budgets_expenses do |t|
      t.belongs_to :budget, index: true
      t.belongs_to :expense, index: true
    end
  end
end
