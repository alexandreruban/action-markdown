require "test_helper"

class ActionMarkdown::AttributeTest < ActionView::TestCase
  test "Instantiating an article with Markdown content converts it to HML" do
    article = Article.new content: "# Title"

    assert_dom_equal %q(<div class="action-markdown"> <h1>Title</h1> </div>), article.content.to_s.squish
  end

  test "Instanciating an article without Markdown content returns an empty string" do
    assert_dom_equal "", Article.new.content.to_s.strip
  end

  test "Creating an article with Markdown content converts it to HML" do
    article = Article.create! content: "# Title"

    assert_dom_equal %q(<div class="action-markdown"> <h1>Title</h1> </div>), article.content.to_s.squish
  end

  test "Creating an article without Markdown content returns an empty string" do
    assert_dom_equal "", Article.create!.content.to_s.strip
  end

  test "An article where content is optional is valid with no content" do
    assert Article.new.valid?
  end

  test "An article where content is required is invalid without a content" do
    assert Article.new.invalid?(:content_presence)
  end

  test "An article with an empty content has an empty content" do
    assert Article.new.content.empty?
  end

  test "An article with a blank content has a blank content" do
    assert Article.new(content: " ").content.blank?
  end

  test "An article without a content has a non present content" do
    assert_not Article.new.content.present?
  end

  test "An article without content has a nil content" do
    assert Article.new.content.nil?
  end
end
