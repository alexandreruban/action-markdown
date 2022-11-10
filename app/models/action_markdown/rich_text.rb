module ActionMarkdown
  class RichText < ApplicationRecord
    self.table_name = "action_markdown_rich_texts"

    belongs_to :record, polymorphic: true, touch: true

    def to_s
      body
    end
  end
end
