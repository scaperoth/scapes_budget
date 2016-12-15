require 'rails_helper'

RSpec.describe "CategoriesExpenses", type: :request do
  describe "GET /categories_expenses" do
    it "works! (now write some real specs)" do
      get categories_expenses_path
      expect(response).to have_http_status(200)
    end
  end
end
