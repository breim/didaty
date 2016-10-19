json.extract! course, :id, :name, :subtitle, :description, :price, :public, :deleted, :category_id, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)