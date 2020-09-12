class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.new(book_comment_params)
		@comment.book_id = @book.id
		if @comment.save
			flash[:success] = "Your Comment was successfully created"
			redirect_to request.referer
		else
			flash[:error] = "Your Comment must not be blank"
			redirect_to request.referer
		end
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.find_by(id: params[:id], book_id: book.id)
		if comment.destroy
			flash[:success] = "Your comment was successfully deleted"
		end
		redirect_to request.referer
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
