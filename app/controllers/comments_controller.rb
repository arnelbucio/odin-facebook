class CommentsController < ApplicationController
  before_action :load_commentable

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.commentable = @commentable
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable, notice: 'Comment created.' }
        format.js
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Comment removed.' }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
