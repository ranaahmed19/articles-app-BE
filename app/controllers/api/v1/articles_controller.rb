class Api::V1::ArticlesController < ActionController::API
  before_action :set_article, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @articles = Article.order(created_at: :DESC)
  end

  def create
    @article = Article.new(article_param)
    unless @article.save
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article.update(article_param)
    unless @article.save
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :template => "api/v1/empty", status: :not_found
  end

  def article_param
    params.require(:article).permit(:body, :title, :user_id)
  end
end
