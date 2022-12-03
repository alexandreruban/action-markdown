module ActionMarkdown
  class Content
    include Serialization

    def initialize(body)
      @body = body
    end

    def to_markdown
      body
    end

    def to_html
      markdown_renderer.render(body_with_components)
    end

    def to_s
      render partial: to_partial_path, layout: false, locals: { content: self }
    end

    def to_partial_path
      "action_markdown/contents/content"
    end

    private

    attr_accessor :body

    def render(*args, &block)
      action_controller_renderer.render(*args, &block)
    end

    def action_controller_renderer
      ActionController::Base.renderer
    end

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

    def body_with_components
      Liquid::Template.parse(body).render
    end
  end
end
