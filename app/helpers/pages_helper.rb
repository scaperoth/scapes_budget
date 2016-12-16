module PagesHelper
  
  
  
  def number_of_budgets
    Budget.all.count
  end
  
  def allowance(budget, incomes, expenses, frequency = 'daily')
    daily_savings = save_amount(budget, frequency)
    total_income =  amount_by_frequency(incomes, frequency)
    total_expenses = amount_by_frequency(expenses, frequency)+daily_savings
    allowance = (total_income - total_expenses)
    allowance.to_i
  end
  
  def save_amount(budget, desired_freq)
    value_to_desired_freq(budget.planned_savings, budget.frequency.name, desired_freq)
  end
  
  private
  
  def amount_by_frequency(model, freq)
    total = 0
    
    model.each do |m|
      mfreq = m.frequency.name
      freq_value = value_to_desired_freq(m.amount, mfreq, freq)
      total += freq_value if mfreq != 'one-time'
    end
    return total.to_f
  end
  
  def _avg(range = nil)
    value = 1
    value = 12 if range == 'months_in_year'
    value = 365.244 if range == 'days_in_year'
    value = 30.437 if range == 'days_in_month'
    value = 4.348 if range == 'weeks_in_month'
    value.to_f
  end
  
  def value_to_desired_freq(value, old_freq, new_freq)
    value = value.to_f
    monthly_value = freq_value_to_monthly(value, old_freq)
    freq_value = monthly_value
    freq_value = monthly_value*_avg('months_in_year') if new_freq == 'yearly'
    freq_value = monthly_value/_avg('weeks_in_month') if new_freq == 'weekly'
    freq_value = monthly_value/(_avg('weeks_in_month')/2) if new_freq == 'bi-weekly'
    freq_value = monthly_value/_avg('days_in_month') if new_freq == 'daily'
    freq_value.to_f
  end 
  
  def freq_value_to_monthly(freq_value, freq)
    freq_value = freq_value.to_f
    monthly_value =  freq_value 
    monthly_value =  freq_value/_avg('months_in_year') if freq == 'yearly'
    monthly_value =  freq_value*_avg('weeks_in_month') if freq == 'weekly'
    monthly_value =  freq_value*(_avg('weeks_in_month')/2) if freq == 'bi-weekly'
    monthly_value =  freq_value*_avg('days_in_month') if freq == 'daily'
    
    monthly_value.to_f
  end
  
end
