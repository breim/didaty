class Concept < ApplicationRecord
  belongs_to :course
  has_many :contents, dependent: :delete_all
  accepts_nested_attributes_for :contents, reject_if: :all_blank, allow_destroy: true
end
