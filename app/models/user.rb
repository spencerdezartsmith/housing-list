class User < ActiveRecord::Base
  has_one :listing, foreign_key: :manager_id
  has_many :responses, foreign_key: :author_id
  has_many :references, foreign_key: :receiver_id
  has_many :tokens, foreign_key: :generator_id
  has_many :messages, foreign_key: :sender_id


  include BCrypt

  has_secure_password

  def written_references
    written_refs = []
    Reference.all.map do |ref|
      if ref.author_id == self.id
        written_refs << ref
      end
    end
    written_refs
  end
end
