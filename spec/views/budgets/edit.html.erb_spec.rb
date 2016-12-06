require 'rails_helper'

RSpec.describe "budgets/edit", type: :view do
  before(:each) do
    @budget = assign(:budget, Budget.create!(
      :name => "MyString",
      :planned_savings => "9.99",
      :user => nil
    ))
  end

  it "renders the edit budget form" do
    render

    assert_select "form[action=?][method=?]", budget_path(@budget), "post" do

      assert_select "input#budget_name[name=?]", "budget[name]"

      assert_select "input#budget_planned_savings[name=?]", "budget[planned_savings]"

      assert_select "input#budget_user_id[name=?]", "budget[user_id]"
    end
  end
end
