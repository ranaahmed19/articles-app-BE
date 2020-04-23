class Api::V1::ArticlesController < ActionController::API
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.order(created_at: :DESC)
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article.update(article_param)
    if @article.save
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:body, :title, :author)
  end
end
