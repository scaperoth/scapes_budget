require 'rails_helper'

RSpec.describe "categories_incomes/show", type: :view do
  before(:each) do
    @categories_income = assign(:categories_income, CategoriesIncome.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
