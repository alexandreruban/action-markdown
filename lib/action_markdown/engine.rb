module ActionMarkdown
  class Engine < ::Rails::Engine
    isolate_namespace ActionMarkdown

    initializer "action_markdown.attribute" do
      ActiveSupport.on_load(:active_record) do
        extend ActionMarkdown::Attribute
      end
    end
  end
end
