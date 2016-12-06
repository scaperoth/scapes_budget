class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.decimal :planned_savings
      t.references :user, index: true

      t.timestamps
    end
  end
end
