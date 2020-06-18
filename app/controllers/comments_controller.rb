class CommentsController < ApplicationController
	before_action :find_commentable, only: [:create]
	before_action :set_comment, except: [:create] 
	before_action :authenticate_user
	
	def create
		@comment = @commentable.comments.build(comment_build)
		@comment.user = current_user
		if params[:comment_id]
			@comment.reply = true
		end
		@comment.save
	end

	def edit
	end

	def update
		if @comment.edit_history == ""
			# if \n => replace with <br/><hr/>
			@comment.edit_history = "Original: " + @comment.body.body.to_plain_text + "\n"
		else
			@comment.edit_history = @comment.edit_history + "Edit: " +params[:comment][:body] + "\n"
		end
		@comment.update(comment_params)
	end

	def destroy
		@comment.destroy
	end

	def history

	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def find_commentable
		#comment
		if params[:comment_id]
			@commentable = Comment.find_by(params[:comment_id])
		elsif 	#post
			@commentable = Post.friendly.find(params[:post_id])
		end
	
	end

	def set comment
		@comment = Comment.find(params[:id])
	end

end
