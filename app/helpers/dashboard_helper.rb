module DashboardHelper
    def expense_percentage(budget)
        percent_of_income = (budget.daily_expenses / budget.daily_income) * 100
        number_to_percentage(percent_of_income, precision: 0)
    end

    def savings_percentage(_budget)
        number_to_percentage((100 - expense_percentage.to_i), precision: 0)
    end

    def date_format(date)
        ord_day = date.strftime('%e').to_i.ordinalize
        date.strftime("%b #{ord_day}, %Y")
    end

    def no_incomes_or_expenses_message(budget)
        missing_incomes = budget.incomes.empty?
        missing_expenses = budget.expenses.empty?

        missing_incomes_and_expenses = missing_incomes && missing_expenses

        message = missing_incomes_and_expenses ? 'incomes or expenses' : (missing_incomes ? 'incomes' : 'expenses')
        
        no_content_message = content_tag 'h2' do 
          ("You don't have any "+ message +" yet. Get started by "+
              link_to("adding some now", budget_path(budget))+".").html_safe
        end
        
        no_content_message
      end
end
