class Listing < ActiveRecord::Base
  has_many :responses
  belongs_to :manager, class_name: 'User'
end
