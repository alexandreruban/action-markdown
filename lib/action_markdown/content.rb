module ActionMarkdown
  class Content
    include Serialization

    def initialize(body)
      @body = body
    end

    def to_html
      renderer.render(body).strip
    end

    def to_s
      to_html
    end

    private

    attr_accessor :body

    def renderer
      @renderer ||= Redcarpet::Markdown.new(
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
