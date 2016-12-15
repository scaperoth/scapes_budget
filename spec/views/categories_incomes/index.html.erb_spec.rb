require 'rails_helper'

RSpec.describe "categories_incomes/index", type: :view do
  before(:each) do
    assign(:categories_incomes, [
      CategoriesIncome.create!(),
      CategoriesIncome.create!()
    ])
  end

  it "renders a list of categories_incomes" do
    render
  end
end
