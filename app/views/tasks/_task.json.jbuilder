json.extract! task, :id, :start_date, :end_date, :planned_hours, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
