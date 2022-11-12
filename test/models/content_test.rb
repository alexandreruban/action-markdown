require "test_helper"

class ActionMarkdown::ContentTest < ActiveSupport::TestCase
  test "#to_html converts the Markdown body to HTML" do
    assert_equal %Q(<h1>Title</h1>), ActionMarkdown::Content.new("# Title").to_html
  end

  test "#to_s converts the Markdown body to HTML" do
    assert_equal %Q(<h1>Title</h1>), ActionMarkdown::Content.new("# Title").to_s
  end
end
