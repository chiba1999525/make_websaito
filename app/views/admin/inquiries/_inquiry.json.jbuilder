json.extract! inquiry, :id, :name, :number, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
