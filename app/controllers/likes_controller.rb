class LikesController < ApplicationController
  before_action :load_likable

  def create
    if current_user.like!(@likable)
      respond_to do |format|
        format.html { redirect_to root_path, notice: "#{@likable.class} liked." }
        format.js
      end
    end
  end

  def destroy
    if current_user.unlike!(@likable)
      redirect_to root_path, notice: "#{@likable.class} unliked."
    end
  end

  private

  def load_likable
    resource, id = request.path.split('/')[1, 2]
    @likable = resource.singularize.classify.constantize.find(id)
  end
end
