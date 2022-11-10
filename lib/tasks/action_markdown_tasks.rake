# frozen_string_literal: true

desc "Copy over the migration"
task "action_markdown:install" do
  Rails::Command.invoke :generate, ["action_markdown:install"]
end
