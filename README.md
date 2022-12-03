# Welcome to ActionMarkdown

Do you like GitHub issues Markdown editor? I love it too! ActionMarkdown aims to provide the same feature out of the box for Rails applications. With ActionMarkdown, it is easy to write some Markdown text in a form field and convert it to HTML seamlessly in the view.

## Installation

Let's add this line to our application's `Gemfile`:

```ruby
gem "action_markdown"
```

We can then run the installation script to copy the migration file:

```bash
bin/rails action_markdown:install
```

Last but not least, we need to run the migration:

```bash
bin/rails db:migrate
```

ActionMarkdown is now installed, we are good to go!

## Usage

Let's imagine we want to write articles in the Markdown format. In our Rails application, we will have an `Article`. To add Markdown content, we need to use the `has_markdown` macro like this:

```rb
class Article < ApplicationRecord
  has_markdown :content

  validates :content, presence: true
end
```

Without adding any new migration, we can now create a new article with Markdown text:

```rb
markdown = <<~MARKDOWN
# Title

This is a paragraph.
MARKDOWN

article = Article.create! content: markdown
```

In the view, the Markdown content will be converted to HTML. For example, in the `ArticlesController#show` view, we can render the content converted to HTML like this:

```erb
<%# articles/show.html.erb %>

<%= @article.content %>
```

In the view above, the Markdown content will automatically be converted to the following HTML:

```html
<h1>Title</h1>
<p>This is a paragraph.</p>
```

**Note**: To use a Markdown fields in forms, we should use the `markdown_field` helper like in the following example:

```erb
<%= form_with model: article do |f| %>
  <%= f.label :content %>
  <%= f.markdown_field :content %>

  <%= f.submit "Save" %>
<% end %>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
