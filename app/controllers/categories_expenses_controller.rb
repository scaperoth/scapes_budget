class CategoriesExpensesController < InheritedResources::Base

  private

    def categories_expense_params
      params.require(:categories_expense).permit()
    end
end

