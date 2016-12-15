class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.text :notes
      t.references :frequency, index: true
      t.references :budget, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
