class IssuesController < ApplicationController
  def show
  	# render plain: params[:id].inspect
  	@issue = Issue.find(params[:id])
  	@comments = @issue.comments
  end

  def new
  	@issue = Issue.new
  end

  def create
  	# render plain: params[:issue].inspect
  	Issue.create(issue_params)
  	redirect_to :root
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    # Issue.update(issue_params)
    # render plain: params[:issue].inspect
    issue = Issue.find(params[:id])
    issue.title = params[:issue][:title]
    issue.content = params[:issue][:content]
    issue.save
    redirect_to issue
  end

  def destroy
  	i = Issue.find(params[:id])
  	i.destroy
  	redirect_to :root
  end

  private
  def issue_params
  	params.require(:issue).permit(:title, :content)
  end
end
