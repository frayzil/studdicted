json.extract! curriculum_topic, :id, :title, :type, :description, :board_id, :created_at, :updated_at
json.url curriculum_topic_url(curriculum_topic, format: :json)
