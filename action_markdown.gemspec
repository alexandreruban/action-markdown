require_relative "lib/action_markdown/version"

Gem::Specification.new do |spec|
  spec.name      = "action-markdown"
  spec.version   = ActionMarkdown::VERSION
  spec.authors   = ["Alexandre Ruban"]
  spec.email     = ["alexandre@hey.com"]
  spec.homepage  = "https://github.com/alexandreruban/action-markdown"
  spec.summary   = "Add rich text to your Ruby on Rails application thanks to Markdown."
  spec.license   = "MIT"

  spec.files = Dir["MIT-LICENSE", "README.md", "lib/**/*", "app/**/*", "config/**/*", "db/**/*"]

  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "rouge"
  spec.add_dependency "redcarpet"
end
