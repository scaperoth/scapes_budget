module PagesHelper
  def number_of_budgets
    Budget.all.count
  end
end
