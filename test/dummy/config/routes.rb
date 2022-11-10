Rails.application.routes.draw do
  mount ActionMarkdown::Engine => "/action_markdown"
end
