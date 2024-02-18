module ActionMarkdown
  class Engine < ::Rails::Engine
    isolate_namespace ActionMarkdown

    initializer "action_markdown.attribute" do
      config.after_initialize do
        ActiveSupport.on_load(:active_record) do
          extend ActionMarkdown::Attribute
        end
      end
    end

    initializer "action_markdown.helper" do
      config.after_initialize do
        ActiveSupport.on_load(:action_controller_base) do
          helper ActionMarkdown::Engine.helpers
        end
      end
    end
  end
end
