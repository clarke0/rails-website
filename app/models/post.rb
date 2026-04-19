class Post < ApplicationRecord
  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true

  def to_param
    slug
  end
end
