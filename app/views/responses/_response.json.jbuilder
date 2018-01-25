json.extract! response, :id, :marks_received, :created_at, :updated_at
json.url response_url(response, format: :json)