class Category < ApplicationRecord
  validates :name, presence: true

  def translated_name
    I18n.t(name, :scope => 'categories')
  end
end
