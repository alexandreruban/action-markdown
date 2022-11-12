require "action_markdown/version"
require "action_markdown/engine"

require "redcarpet"

module ActionMarkdown
  extend ActiveSupport::Autoload

  autoload :Attribute
  autoload :Content
  autoload :Renderer
  autoload :Serialization
end
