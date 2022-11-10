module ActionMarkdown
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      def create_migrations
        rails_command "railties:install:migrations FROM=action_markdown", inline: true
      end
    end
  end
end
