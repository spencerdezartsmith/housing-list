class Token < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  belongs_to :generator, class_name: 'User', foreign_key: :generator_id
  belongs_to :new_member, class_name: 'User', foreign_key: :new_member_id
end
