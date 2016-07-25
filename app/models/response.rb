class Response < ActiveRecord::Base
  belongs_to :listing
  belongs_to :author, class_name: 'User'
end
