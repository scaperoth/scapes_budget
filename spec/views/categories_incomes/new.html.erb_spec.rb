require 'rails_helper'

RSpec.describe "categories_incomes/new", type: :view do
  before(:each) do
    assign(:categories_income, CategoriesIncome.new())
  end

  it "renders new categories_income form" do
    render

    assert_select "form[action=?][method=?]", categories_incomes_path, "post" do
    end
  end
end
