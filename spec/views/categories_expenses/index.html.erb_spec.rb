require 'rails_helper'

RSpec.describe "categories_expenses/index", type: :view do
  before(:each) do
    assign(:categories_expenses, [
      CategoriesExpense.create!(),
      CategoriesExpense.create!()
    ])
  end

  it "renders a list of categories_expenses" do
    render
  end
end
