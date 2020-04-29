class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]
  layout "application"

  def index
    @articles = Article.order(created_at: :DESC)
  end

  def create
    @article = Article.new(article_param)
    unless @article.save
      @message = @article.errors
      render status: :unprocessable_entity
    end
  end

  def update
    @article.update(article_param)
    unless @article.save
      @message = @article.errors
      render status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @message = "Article not found"
    render status: :not_found
  end

  def article_param
    params.require(:article).permit(:body, :title, :user_id)
  end
end
