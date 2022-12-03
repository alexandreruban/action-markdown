require "action_view/helpers/tags/placeholderable"

module ActionMarkdown
  module TagHelper
    def markdown_field_tag(name, value = nil, options = {})
      options = options.symbolize_keys

      content_tag("textarea", value, options)
    end
  end
end

module ActionView::Helpers
  class Tags::ActionMarkdown < Tags::Base
    include Tags::Placeholderable

    def render
      options = @options.stringify_keys
      options["value"] = options.fetch("value") { value&.to_markdown }
      add_default_name_and_id(options)

      @template_object.markdown_field_tag("textarea", options["value"], options.except("value"))
    end
  end

  module FormHelper
    def markdown_field(object_name, method, options = {})
      Tags::ActionMarkdown.new(object_name, method, self, options).render
    end
  end

  class FormBuilder
    def markdown_field(method, options = {})
      @template.markdown_field(@object_name, method, objectify_options(options))
    end
  end
end
