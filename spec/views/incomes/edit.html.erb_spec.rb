require 'rails_helper'

RSpec.describe "incomes/edit", type: :view do
  before(:each) do
    @income = assign(:income, Income.create!(
      :frequency => "MyString",
      :name => "MyString",
      :amount => "9.99",
      :notes => "MyText",
      :budget => nil,
      :user => nil
    ))
  end

  it "renders the edit income form" do
    render

    assert_select "form[action=?][method=?]", income_path(@income), "post" do

      assert_select "input#income_frequency[name=?]", "income[frequency]"

      assert_select "input#income_name[name=?]", "income[name]"

      assert_select "input#income_amount[name=?]", "income[amount]"

      assert_select "textarea#income_notes[name=?]", "income[notes]"

      assert_select "input#income_budget_id[name=?]", "income[budget_id]"

      assert_select "input#income_user_id[name=?]", "income[user_id]"
    end
  end
end
