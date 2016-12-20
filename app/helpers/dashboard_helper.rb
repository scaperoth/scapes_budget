module DashboardHelper
  
  def expense_percentage(budget)
    percent_of_income = (budget.daily_expenses / budget.daily_income)*100
    number_to_percentage(percent_of_income, precision: 0 )
  end 
    
  def savings_percentage(budget)
    number_to_percentage((100 - expense_percentage.to_i), precision: 0 )
  end 
  
  def date_format(date)
    ord_day = date.strftime('%e').to_i.ordinalize
    date.strftime("%b #{ord_day}, %Y")
  end 
end
