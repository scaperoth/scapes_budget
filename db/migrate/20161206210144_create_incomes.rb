class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :frequency
      t.string :name
      t.decimal :amount
      t.text :notes
      t.references :budget, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
