require "rouge/plugins/redcarpet"

module ActionMarkdown
  class Renderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end
end
