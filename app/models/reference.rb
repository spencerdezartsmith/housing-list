class Reference < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User'
  belongs_to :author, class_name: 'User'
end
