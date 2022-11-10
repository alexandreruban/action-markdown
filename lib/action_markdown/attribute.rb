module ActionMarkdown
  module Attribute
    def has_markdown(name)
      class_eval <<-CODE, __FILE__, __LINE__ + 1
        def #{name}
          markdown_#{name} || build_markdown_#{name}
        end

        def #{name}=(body)
          self.#{name}.body = body
        end
      CODE

      has_one :"markdown_#{name}", -> { where(name: name) }, class_name: "ActionMarkdown::RichText",
        as: :record, inverse_of: :record, autosave: true, dependent: :destroy

      scope :"with_markdown_#{name}", -> { includes("markdown_#{name}") }
    end
  end
end
