module ActionMarkdown
  class MarkdownText < ApplicationRecord
    self.table_name = "action_markdown_markdown_texts"

    serialize :body, ActionMarkdown::Content

    belongs_to :record, polymorphic: true, touch: true

    delegate :to_s, :to_html, to: :body
  end
end
