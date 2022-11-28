module ActionMarkdown
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root ActionMarkdown::Engine.root

      def create_migrations
        rails_command "railties:install:migrations FROM=action_markdown", inline: true
      end

      def create_action_markdown_files
        copy_file(
          "app/assets/stylesheets/action_markdown/action_markdown.css",
          "app/assets/stylesheets/action_markdown.css"
        )

        copy_file(
          "app/views/action_markdown/contents/_content.html.erb",
          "app/views/action_markdown/contents/_content.html.erb"
        )
      end
    end
  end
end
