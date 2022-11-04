json.extract! task, :id, :title, :description, :due_date, :owner_id, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
