json.(article, :id, :title, :body)
json.author article.user, partial: "api/v1/users/user", as: :user
