json.(article, :id, :title, :body, :created_at)
json.author article.user, partial: "api/v1/users/user", as: :user
