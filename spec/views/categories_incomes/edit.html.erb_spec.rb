require 'rails_helper'

RSpec.describe "categories_incomes/edit", type: :view do
  before(:each) do
    @categories_income = assign(:categories_income, CategoriesIncome.create!())
  end

  it "renders the edit categories_income form" do
    render

    assert_select "form[action=?][method=?]", categories_income_path(@categories_income), "post" do
    end
  end
end
