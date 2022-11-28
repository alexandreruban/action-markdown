# Markdown styling

This article will contain unordered lists:

- First item
- Second item

It will also contain ordered lists:

1. First item
2. Second item

It will also contain some `ActionMarkdown::MarkdownText` inline code in the middle of the sentence and at the end `ActiveRecord::Base`.

Last but not least, code blocks are painful to style, so let's style them once and for all. Here is some Ruby code:

```rb
# frozen_string_literal: true

class Article < ActiveRecord::Base
  include ActiveModel::Model

  PAGE_COUNT = 5

  attr_reader :something

  class << self
    def whatever
      return 1 + 1 if self.is_a?(Article)
    end
  end

  def inialize(content: nil)
    @content = content
  end

  def method
    10.times.with_index do |index|
      puts "Something very long to overflow overflow overflow overflow overflow overflow in the HTML"
    end
  end

  def error
    raise NotImplementedError, "Subclass responsibility"
  end
end
```

Here is some SCSS code:

```scss
// Comment

:root {
  --font-family-sans: 'Lato', -apple-system;
  --variable: 20px;
}

@mixin media($query) {
  @if $query == tabletAndUp {
    @media (min-width: 50rem) { @content; }
  }
}

.card {
  border-radius: 1rem;
  padding: var(--variable);
}
```

Here is some HTML+erb:

```erb
<%# Comment %>

<%= content_for :meta_title, @article.meta_title %>

<h1>Articles</h1>

<div class="border rounded p-3">
  <% @articles.each do |article| %>
    <%= render article %>
  <% end %>
</div>
```

Here is some JavaScript code:

```js
import { Controller } from "@hotwired/stimulus"
import { debounce } from "../helpers/debounce_helpers"

export default class extends Controller {
  static classes = ["active"]

  initialize() {
    this.scroll = debounce(this.scroll.bind(this), 15)
  }

  scroll() {
    if (window.scrollY >= 40) {
      this.element.classList.add(this.activeClass)
    } else {
      this.element.classList.remove(this.activeClass)
    }
  }
}
```
