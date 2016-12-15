require 'rails_helper'

RSpec.describe "CategoriesIncomes", type: :request do
  describe "GET /categories_incomes" do
    it "works! (now write some real specs)" do
      get categories_incomes_path
      expect(response).to have_http_status(200)
    end
  end
end
