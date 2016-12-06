json.extract! expense, :id, :frequency, :name, :amount, :notes, :budget_id, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)