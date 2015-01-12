class CommentsController < ApplicationController
	def create
		# render plain: params.inspect
		c = Comment.new(params_comment)
		c.save
		redirect_to c.issue
	end

	private
	def params_comment
		params.require(:comment).permit(:issue_id, :user_id, :content)
	end
end
