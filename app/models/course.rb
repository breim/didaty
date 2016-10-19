class Course < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, :subtitle, :category_id, :user_id, presence: true
end