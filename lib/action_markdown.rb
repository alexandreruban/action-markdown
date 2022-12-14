require "action_markdown/version"
require "action_markdown/engine"

require "redcarpet"
require "rouge"

module ActionMarkdown
  extend ActiveSupport::Autoload

  autoload :Attribute
  autoload :Content
  autoload :Renderer
  autoload :Rendering
  autoload :Serialization
end
