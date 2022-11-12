module ActionMarkdown
  class RichText < ApplicationRecord
    self.table_name = "action_markdown_rich_texts"

    serialize :body, ActionMarkdown::Content

    belongs_to :record, polymorphic: true, touch: true

    delegate :to_s, :to_html, to: :body
  end
end
