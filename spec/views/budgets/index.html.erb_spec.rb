require 'rails_helper'

RSpec.describe "budgets/index", type: :view do
  before(:each) do
    assign(:budgets, [
      Budget.create!(
        :name => "Name",
        :planned_savings => "9.99",
        :user => nil
      ),
      Budget.create!(
        :name => "Name",
        :planned_savings => "9.99",
        :user => nil
      )
    ])
  end

  it "renders a list of budgets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
