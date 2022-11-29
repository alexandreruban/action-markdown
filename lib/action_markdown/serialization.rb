# frozen_string_literal: true

module ActionMarkdown
  module Serialization
    extend ActiveSupport::Concern

    class_methods do
      def load(content)
        new(content) if content
      end

      def dump(content)
        case content
        when nil
          nil
        when self
          content.to_markdown
        when ActionMarkdown::MarkdownText
          content.body.to_markdown
        else
          new(content).to_markdown
        end
      end
    end
  end
end
