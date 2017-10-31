class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true

  has_many :posts

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User
end
