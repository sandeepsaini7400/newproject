class CommentsController < ApplicationController

http_basic_authenticate_with name: "saini", password: "12345", only: :destroy	


def create 
	@article = Article.find(params[:article_id])
	@comment = @article.comments.create(comment_params)
	redirect_to article_path(@article)
end

def edit
  @article = Article.find(params[:article_id])
 	@comment = @article.comments.find(params[:id])
end


def update
  @comment = Comment.find(params[:id])
  
    if @comment.update(comment_params)
     redirect_to article_path, status: :see_other
    else
     render :edit, status: :unprocessable_entity
   end
 end

def destroy
	@article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	@comment.destroy
	redirect_to article_path(@article), status: :see_other
end


private
	def comment_params
		params.require(:comment).permit(:commenter, :body, :status)
	end
end




