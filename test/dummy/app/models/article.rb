class Article < ApplicationRecord
  has_markdown :content

  validates :content, presence: true, on: :content_presence
end
