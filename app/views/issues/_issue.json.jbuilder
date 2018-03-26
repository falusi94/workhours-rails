json.extract! issue, :id, :name, :description, :project_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)
