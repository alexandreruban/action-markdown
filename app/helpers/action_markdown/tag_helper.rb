require "action_view/helpers/tags/placeholderable"

module ActionMarkdown
  module TagHelper
    cattr_accessor(:id, instance_accessor: false) { 0 }

    def markdown_field_tag(name, value = nil, options = {})
      options = options.symbolize_keys
      options[:id] ||= "action_markdown_input_#{ActionMarkdown::TagHelper.id += 1}"

      markdown_toolbar(id: options[:id]) + content_tag("textarea", value, options)
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

module ActionMarkdown
  module TagHelper
    def markdown_toolbar(id:)
      <<~HTML.squish.html_safe
        <markdown-toolbar class="action-markdown-toolbar" for="#{id}">
          <md-header aria-label="Header" role="button">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M6 4V20ZM18 4V20Z"/>
              <path d="M6 4V20H8V13H16V20H18V4H16V11H8V4H6Z"/>
            </svg>
          </md-header>
          <md-bold aria-label="Bold" role="button">
            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M8 11h4.5a2.5 2.5 0 0 0 0-5H8v5Zm10 4.5a4.501 4.501 0 0 1-4.5 4.5H6V4h6.5a4.5 4.5 0 0 1 3.256 7.606A4.5 4.5 0 0 1 18 15.5ZM8 13v5h5.5a2.5 2.5 0 0 0 0-5H8Z"></path>
            </svg>
          </md-bold>
          <md-italic aria-label="Italic" role="button">
            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M15 20H7v-2h2.927l2.116-12H9V4h8v2h-2.927l-2.116 12H15v2Z"></path>
            </svg>
          </md-italic>
          <md-quote aria-label="Quote" role="button">
            <svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
              <path d="M4.583 17.321C3.553 16.227 3 15 3 13.011c0-3.5 2.457-6.637 6.03-8.188l.893 1.378c-3.335 1.804-3.987 4.145-4.247 5.621.537-.278 1.24-.375 1.929-.311 1.804.167 3.226 1.648 3.226 3.489a3.5 3.5 0 0 1-3.5 3.5 3.871 3.871 0 0 1-2.748-1.179zm10 0C13.553 16.227 13 15 13 13.011c0-3.5 2.457-6.637 6.03-8.188l.893 1.378c-3.335 1.804-3.987 4.145-4.247 5.621.537-.278 1.24-.375 1.929-.311 1.804.167 3.226 1.648 3.226 3.489a3.5 3.5 0 0 1-3.5 3.5 3.871 3.871 0 0 1-2.748-1.179z"></path>
            </svg>
          </md-quote>
          <md-code aria-label="Code" role="button">
            <svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
              <path d="m23 12-7.071 7.071-1.414-1.414L20.172 12l-5.657-5.657 1.414-1.414zM3.828 12l5.657 5.657-1.414 1.414L1 12l7.071-7.071 1.414 1.414z"></path>
            </svg>
          </md-code>
          <md-link aria-label="Link" role="button">
            <svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
              <path d="M18.364 15.536 16.95 14.12l1.414-1.414a5.001 5.001 0 0 0-3.531-8.551 5 5 0 0 0-3.54 1.48L9.879 7.05 8.464 5.636 9.88 4.222a7 7 0 1 1 9.9 9.9l-1.415 1.414zm-2.828 2.828-1.415 1.414a7 7 0 0 1-9.9-9.9l1.415-1.414L7.05 9.88l-1.414 1.414a5 5 0 1 0 7.071 7.071l1.414-1.414 1.415 1.414zm-.708-10.607 1.415 1.415-7.071 7.07-1.415-1.414 7.071-7.07z"></path>
            </svg>
          </md-link>
          <md-image aria-label="Image" role="button">
            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M20 5H4v14l9.292-9.294a1 1 0 0 1 1.414 0L20 15.01V5zM2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path>
            </svg>
          </md-image>
          <md-unordered-list aria-label="Unordered list" role="button">
            <svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
              <path d="M8 4h13v2H8zM4.5 6.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 7a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 6.9a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zM8 11h13v2H8zm0 7h13v2H8z"></path>
            </svg>
          </md-unordered-list>
          <md-ordered-list aria-label="Ordered list" role="button">
            <svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
              <path d="M8 4h13v2H8zM5 3v3h1v1H3V6h1V4H3V3zM3 14v-2.5h2V11H3v-1h3v2.5H4v.5h2v1zm2 5.5H3v-1h2V18H3v-1h3v4H3v-1h2zM8 11h13v2H8zm0 7h13v2H8z"></path>
            </svg>
          </md-ordered-list>
        </markdown-toolbar>
      HTML
    end
  end
end
