class CommentsController < ApplicationController
		respond_to :html, :js

		def create
		@article = Article.find(params[:article_id])
		@comment=@article.comments.create(comments_params)

	
		redirect_to  article_path(@article)
	end

private

def comments_params
  params.require(:comment).permit(:content)
end		
end
