class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :name
      t.index :weight
      t.belongs_to :income, index: true
      t.belongs_to :expense, index: true
      t.belongs_to :budget, index: true
      t.timestamps
    end
  end
end
