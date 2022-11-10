require "test_helper"

class AttributeTest < ActiveSupport::TestCase
  test "Creating an article with markdown content" do
    article = Article.create! content: "# Title"

    assert_equal %q(# Title), article.content.to_s
  end
end
