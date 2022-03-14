class ArticleController < ApplicationController
  getter article = Article.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_article }
  end

  def index
    articles = Article.all
    render "index.ecr"
  end

  def show
    render "show.ecr"
  end

  def new
    render "new.ecr"
  end

  def edit
    render "edit.ecr"
  end

  def create
    article = Article.new article_params.validate!
    if article.save
      redirect_to action: :index, flash: {"success" => "Article has been created."}
    else
      flash[:danger] = "Could not create Article!"
      render "new.ecr"
    end
  end

  def update
    article.set_attributes article_params.validate!
    if article.save
      redirect_to action: :index, flash: {"success" => "Article has been updated."}
    else
      flash[:danger] = "Could not update Article!"
      render "edit.ecr"
    end
  end

  def destroy
    article.destroy
    redirect_to action: :index, flash: {"success" => "Article has been deleted."}
  end

  private def article_params
    params.validation do
      required :title
      required :body
    end
  end

  private def set_article
    @article = Article.find! params[:id]
  end
end
