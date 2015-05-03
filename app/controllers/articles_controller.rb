class ArticlesController < ApplicationController

  def index    # view is index.html.erb
    @articles = Article.all
  end

  def show    # view is show.html.erb - show individual article
    @article = Article.find(params[:id])
  end

  def new    # view is new.html.erb  - shows form to create new article
    @article = Article.new
  end

  def edit  # view is edit.html.erb  - shows form to edit existing article
    @article = Article.find(params[:id])
  end

  def create  # does not have a view since it is a POST. Redirects
    # @article = Article.new(article_params) if using private method
    @article = Article.new(title: params[:article][:title],
                           text: params[:article][:text])

    if @article.save
      redirect_to @article   # if saved redirects to show page
      # redirect_to article_path(@article)  can also write like this
    else
      render 'new'            if not saved redirects to new.html.erb
    end

  end

  def update # does not have a view since it is a PUT. Redirects
    @article = Article.find(params[:id])

    # if @article.update(article_params)
    if @article.update(title: params[:article][:title],
                       text: params[:article][:text])
      redirect_to @article # if saved redirects show view
    else
      render 'edit'  # if not saved takes you back to edit form
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  # private method
  #   def article_params
  #     params.require(:article).permit(:title, :text)
  #   end

  end
