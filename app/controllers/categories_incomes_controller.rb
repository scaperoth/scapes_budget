class CategoriesIncomesController < InheritedResources::Base

  private

    def categories_income_params
      params.require(:categories_income).permit()
    end
end

