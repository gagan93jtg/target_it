json.extract! question, :id, :question_str, :opt1, :marks1, :opt2, :marks2, :opt3, :marks3, :opt4, :marks4, :created_at, :updated_at
json.url question_url(question, format: :json)