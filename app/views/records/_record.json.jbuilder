json.extract! record, :id, :user_id, :issue_id, :date, :time, :created_at, :updated_at
json.url record_url(record, format: :json)
