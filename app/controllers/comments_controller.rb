class CommentsController < ApplicationController

  def create

    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(commenter: params[:comment][:commenter],
                                        body: params[:comment][:body])

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end
end
