require 'rails_helper'

RSpec.describe "categories_expenses/show", type: :view do
  before(:each) do
    @categories_expense = assign(:categories_expense, CategoriesExpense.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
