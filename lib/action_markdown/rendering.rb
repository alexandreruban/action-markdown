module ActionMarkdown
  module Rendering
    private

    def render(*args, &block)
      action_controller_renderer.render(*args, &block)
    end

    def action_controller_renderer
      ActionController::Base.renderer
    end
  end
end
