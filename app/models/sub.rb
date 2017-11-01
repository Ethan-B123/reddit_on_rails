class Sub < ApplicationRecord
  validates :title, :description, presence: true

  has_many :post_subs,
    dependent: :destroy,
    inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User
end
