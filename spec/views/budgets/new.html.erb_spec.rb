require 'rails_helper'

RSpec.describe "budgets/new", type: :view do
  before(:each) do
    assign(:budget, Budget.new(
      :name => "MyString",
      :planned_savings => "9.99",
      :user => nil
    ))
  end

  it "renders new budget form" do
    render

    assert_select "form[action=?][method=?]", budgets_path, "post" do

      assert_select "input#budget_name[name=?]", "budget[name]"

      assert_select "input#budget_planned_savings[name=?]", "budget[planned_savings]"

      assert_select "input#budget_user_id[name=?]", "budget[user_id]"
    end
  end
end
