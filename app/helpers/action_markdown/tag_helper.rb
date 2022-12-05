require "action_view/helpers/tags/placeholderable"

module ActionMarkdown
  module TagHelper
    cattr_accessor(:id, instance_accessor: false) { 0 }

    def markdown_field_tag(name, value = nil, options = {})
      options = options.symbolize_keys

      options[:id] ||= "action_markdown_input_#{ActionMarkdown::TagHelper.id += 1}"

      toolbar = tag.markdown_toolbar for: options[:id] do
        concat tag.md_bold "Bold"
        concat tag.md_header "Header"
        concat tag.md_italic "Italic"
        concat tag.md_quote "Quote"
        concat tag.md_code "Code"
        concat tag.md_link "Link"
        concat tag.md_image "Image"
        concat tag.md_unordered_list "Unordered list"
        concat tag.md_ordered_list "Ordered list"
      end
      textarea = content_tag("textarea", value, options)

      toolbar + textarea
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
