module ActionMarkdown
  class MarkdownText < ApplicationRecord
    self.table_name = "action_markdown_markdown_texts"

    serialize :body, ActionMarkdown::Content

    belongs_to :record, polymorphic: true, touch: true

    delegate :to_s, :nil?, to: :body
    delegate :to_markdown, to: :body, allow_nil: true
    delegate :blank?, :empty?, :present?, to: :to_html

    def to_html
      body&.to_html.to_s
    end
  end
end
