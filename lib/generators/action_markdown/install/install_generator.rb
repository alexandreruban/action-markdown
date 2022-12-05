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

      def install_javascript_dependencies
        if Rails.root.join("config/importmap.rb").exist?
          say "Import @github/markdown-toolbar-element", :green
          append_to_file "app/javascript/application.js", %(import "@github/markdown-toolbar-element"\n)

          github_lib  = "@github/markdown-toolbar-element"
          github_link = "https://ga.jspm.io/npm:@github/markdown-toolbar-element@2.1.1/dist/index.js"

          say "Pin #{github_lib}", :green
          append_to_file "config/importmap.rb", %(pin "#{github_lib}", to: "#{github_link}"\n)
        elsif Rails.root.join("package.json").exist?
          say "Import @github/markdown-toolbar-element", :green
          append_to_file "app/javascript/application.js", %(import "@github/markdown-toolbar-element"\n)

          say "Install @github/markdown-toolbar-element", :green
          run "yarn add @github/markdown-toolbar-element@2.1.1"
        else
          say <<~TEXT.squish, :red
            You must either be running with node (package.json) or
            importmap-rails (config/importmap.rb) to use action_markdown.
          TEXT
        end
      end
    end
  end
end
