require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      :frequency => "MyString",
      :name => "MyString",
      :amount => "9.99",
      :notes => "MyText",
      :budget => nil,
      :user => nil
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "input#expense_frequency[name=?]", "expense[frequency]"

      assert_select "input#expense_name[name=?]", "expense[name]"

      assert_select "input#expense_amount[name=?]", "expense[amount]"

      assert_select "textarea#expense_notes[name=?]", "expense[notes]"

      assert_select "input#expense_budget_id[name=?]", "expense[budget_id]"

      assert_select "input#expense_user_id[name=?]", "expense[user_id]"
    end
  end
end
