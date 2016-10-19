class Course < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, :subtitle, :category_id, :user_id, presence: true
  
  # PaperClip + ftp
  has_attached_file :image,:styles => {
    :large => "512x512" ,
    :medium => "200x200" ,
    :small => "168x168",
    :thumb => "40x40",
    :tiny => "32x32"
  },
  :path => ":rails_root/public/courses/:id-:style.:extension",
  :url  => "/courses/:id-:style.:extension",
  :default_url => :set_default_url
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 10.megabytes

  def set_default_url
    'missing.png'
  end
end