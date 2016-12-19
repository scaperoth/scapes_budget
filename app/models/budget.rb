class Budget < ActiveRecord::Base
    include ActionView::Helpers::NumberHelper
    belongs_to :user
    has_many :incomes
    has_many :expenses

    validates_uniqueness_of :active, if: :active, message: 'only one budget can be active at a time'
    validates_uniqueness_of :name, message: 'budget names must be unique'
    
    def incomes
        Income.where(budget: id)
    end

    def expenses
        Expense.where(budget: id)
    end

    # time remaining
    def days_remaining
        (end_date - Date.today).to_i
    end

    def weeks_remaining
        (days_remaining / 7)
    end

    def months_remaining
        ((end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)).to_i
    end

    def years_remaining
        (end_date.year - start_date.year).to_i
    end

    # income breakdown
    def daily_income
        sum_amounts(incomes, 'daily')
    end

    def weekly_income
        sum_amounts(incomes, 'weekly')
    end

    def monthly_income
        sum_amounts(incomes, 'monthly')
    end

    # expenses breakdown
    def daily_expenses
        sum_amounts(expenses, 'daily')
    end

    def weekly_expenses
        sum_amounts(expenses, 'weekly')
    end

    def monthly_expenses
        sum_amounts(expenses, 'monthly')
    end

    # allowance breakdown
    def daily_allowance
        allowance(freq = 'daily')
    end

    def weekly_allowance
        allowance(freq = 'weekly')
    end

    def monthly_allowance
        allowance(freq = 'monthly')
    end

    # savings breakdown
    def savings_potential(freq = 'daily')
        difference = (daily_income - daily_expenses)
        case freq
        when 'weekly' then
            sp = difference * 7
        when 'monthly' then
            sp = difference* days_in_month
        else
            sp = difference
        end

        number_to_currency(sp)
    end
    
    def required_savings(freq = 'daily')
      amount_by_date_range(planned_savings,start_date, end_date, freq)
    end 

    def allowance(freq = 'daily')
        total_income = sum_amounts(incomes, freq)
        total_expenses = sum_amounts(expenses, freq)
        savings = required_savings(freq)
        (total_income - total_expenses - savings).to_f
    end

    protected

    private

    def months_in_year
        12
    end

    def weeks_in_month
        4.34524
    end

    def days_in_month
        30.4167
    end

    def amount_by_date_range(amount,start_date, end_date, freq = 'daily')
        start_date = Date.parse start_date.to_s
        end_date = Date.parse end_date.to_s
        time_remaining = case freq
                         when 'weekly'
                             weeks_remaining
                         when 'monthly'
                             months_remaining
                         when 'yearly'
                             years_remaining
                         else
                             days_remaining
                         end
        time_remaining = 1 if time_remaining.zero?
        (amount.to_f / time_remaining)
    end

    def sum_amounts(rows, freq)
        total = 0

        rows.each do |r|
            total += if !r.frequency.name.casecmp('one-time').zero?
                         amount_to_new_frequency(r, freq)
                     else
                         r.amount
                     end
        end

        total
    end

    def amount_to_new_frequency(row, _new_freq)
        _new_freq = _new_freq.downcase
        monthly_value = amount_to_monthly(row)
        new_value = case _new_freq
                    when 'daily'
                        monthly_value / days_in_month
                    when 'weekly'
                        monthly_value / weeks_in_month
                    when 'bi-weekly'
                        monthly_value / (weeks_in_month / 2)
                    when 'yearly'
                        monthly_value * months_in_year
                    else
                        monthly_value
                         end

        new_value
    end

    def amount_to_monthly(row)
        freq = row.frequency.name.downcase
        new_value = case freq
                    when 'daily'
                        row.amount * days_in_month
                    when 'weekly'
                        row.amount * weeks_in_month
                    when 'bi-weekly'
                        row.amount * (weeks_in_month / 2)
                    when 'yearly'
                        row.amount / months_in_year
                    else
                        row.amount
                         end

        new_value
    end
end
