puts "START rails db:seed"

puts "Deleting old articles..."
Article.destroy_all

puts "Creating new articles..."
Article.create! content: File.open(File.expand_path("../../fixtures/content.md", __dir__)).read

puts "END rails db:seed!"
