class Listing < ActiveRecord::Base
  include Paperclip::Glue
  
  has_many :responses
  belongs_to :manager, class_name: 'User'
  has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
