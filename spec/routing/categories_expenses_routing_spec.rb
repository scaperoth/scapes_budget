require "rails_helper"

RSpec.describe CategoriesExpensesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/categories_expenses").to route_to("categories_expenses#index")
    end

    it "routes to #new" do
      expect(:get => "/categories_expenses/new").to route_to("categories_expenses#new")
    end

    it "routes to #show" do
      expect(:get => "/categories_expenses/1").to route_to("categories_expenses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/categories_expenses/1/edit").to route_to("categories_expenses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/categories_expenses").to route_to("categories_expenses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/categories_expenses/1").to route_to("categories_expenses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/categories_expenses/1").to route_to("categories_expenses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/categories_expenses/1").to route_to("categories_expenses#destroy", :id => "1")
    end

  end
end
