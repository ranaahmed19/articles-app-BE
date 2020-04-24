class Api::V1::ArticlesController < ActionController::API
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.order(created_at: :DESC)
    # render json: @articles, :include => [:user]
    render status: :ok
  end

  def show
    render status: :ok
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      render :template => "api/v1/articles/show", status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article.update(article_param)
    if @article.save
      render :template => "api/v1/articles/show", status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    render :template => "api/v1/empty", status: :ok
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
