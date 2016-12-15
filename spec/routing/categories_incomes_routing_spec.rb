require "rails_helper"

RSpec.describe CategoriesIncomesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/categories_incomes").to route_to("categories_incomes#index")
    end

    it "routes to #new" do
      expect(:get => "/categories_incomes/new").to route_to("categories_incomes#new")
    end

    it "routes to #show" do
      expect(:get => "/categories_incomes/1").to route_to("categories_incomes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/categories_incomes/1/edit").to route_to("categories_incomes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/categories_incomes").to route_to("categories_incomes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/categories_incomes/1").to route_to("categories_incomes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/categories_incomes/1").to route_to("categories_incomes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/categories_incomes/1").to route_to("categories_incomes#destroy", :id => "1")
    end

  end
end
