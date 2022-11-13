module ActionMarkdown
  class Content
    include ActiveModel::Conversion, Rendering, Serialization

    def initialize(body)
      @body = body
    end

    def to_html
      markdown_renderer.render(body)
    end

    def to_s
      render partial: to_partial_path, layout: false, locals: { content: self }
    end

    private

    attr_accessor :body

    def markdown_renderer
      @markdown_renderer ||= Redcarpet::Markdown.new(
        Renderer,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        autolink: true,
        strikethrough: true,
        superscript: true,
        tables: true
      )
    end
  end
end
