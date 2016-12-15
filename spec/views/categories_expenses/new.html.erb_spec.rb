require 'rails_helper'

RSpec.describe "categories_expenses/new", type: :view do
  before(:each) do
    assign(:categories_expense, CategoriesExpense.new())
  end

  it "renders new categories_expense form" do
    render

    assert_select "form[action=?][method=?]", categories_expenses_path, "post" do
    end
  end
end
