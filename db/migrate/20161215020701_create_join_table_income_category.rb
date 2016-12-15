class CreateJoinTableIncomeCategory < ActiveRecord::Migration
  def change
    create_join_table :incomes, :categories do |t|
      t.index [:income_id, :category_id]
      t.index [:category_id, :income_id]
    end
  end
end
