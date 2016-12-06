require 'rails_helper'

RSpec.describe "incomes/index", type: :view do
  before(:each) do
    assign(:incomes, [
      Income.create!(
        :frequency => "Frequency",
        :name => "Name",
        :amount => "9.99",
        :notes => "MyText",
        :budget => nil,
        :user => nil
      ),
      Income.create!(
        :frequency => "Frequency",
        :name => "Name",
        :amount => "9.99",
        :notes => "MyText",
        :budget => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of incomes" do
    render
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
