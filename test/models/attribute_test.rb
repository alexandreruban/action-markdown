require "test_helper"

class ActionMarkdown::AttributeTest < ActiveSupport::TestCase
  test "Instantiating an article with Markdown content converts it to HML" do
    article = Article.new content: "# Title"

    assert_equal %q(<h1>Title</h1>), article.content.to_s
  end

  test "Instanciating an article without Markdown content returns an empty string" do
    assert_equal "", Article.new.content.to_s
  end

  test "Creating an article with Markdown content converts it to HML" do
    article = Article.create! content: "# Title"

    assert_equal %q(<h1>Title</h1>), article.content.to_s
  end

  test "Creating an article without Markdown content returns an empty string" do
    assert_equal "", Article.create!.content.to_s
  end
end
