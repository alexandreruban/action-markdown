require "test_helper"

class ActionMarkdown::AttributeTest < ActionView::TestCase
  test "Instantiating an article with Markdown content converts it to HML" do
    article = Article.new content: "# Title"

    assert_dom_equal %q(<h1>Title</h1>), article.content.to_s.strip
  end

  test "Instanciating an article without Markdown content returns an empty string" do
    assert_dom_equal "", Article.new.content.to_s.strip
  end

  test "Creating an article with Markdown content converts it to HML" do
    article = Article.create! content: "# Title"

    assert_dom_equal %q(<h1>Title</h1>), article.content.to_s.strip
  end

  test "Creating an article without Markdown content returns an empty string" do
    assert_dom_equal "", Article.create!.content.to_s.strip
  end
end
