class CommentsController < ApplicationController
	def create
		# render plain: params.inspect
		c = Comment.create
		c.username = params[:username]
		c.email = params[:email]
		c.content = params[:content]
		c.issue_id = params[:issue_id]
		c.save
		issue = Issue.find(params[:issue_id])
		redirect_to issue
	end
end
