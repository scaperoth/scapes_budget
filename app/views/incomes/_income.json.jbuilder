json.extract! income, :id, :frequency, :name, :amount, :notes, :budget_id, :user_id, :created_at, :updated_at
json.url income_url(income, format: :json)