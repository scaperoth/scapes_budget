require 'rails_helper'

RSpec.describe "categories_expenses/edit", type: :view do
  before(:each) do
    @categories_expense = assign(:categories_expense, CategoriesExpense.create!())
  end

  it "renders the edit categories_expense form" do
    render

    assert_select "form[action=?][method=?]", categories_expense_path(@categories_expense), "post" do
    end
  end
end
