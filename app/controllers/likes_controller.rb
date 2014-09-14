class LikesController < ApplicationController
  before_action :load_likable

  def create
    if current_user.like!(@likable)
      redirect_to @likable, notice: "#{@likable.class} liked."
    end
  end

  def destroy
    if current_user.unlike!(@likable)
      redirect_to @likable, notice: "#{@likable.class} unliked."
    end
  end

  private

  def load_likable
    resource, id = request.path.split('/')[1, 2]
    @likable = resource.singularize.classify.constantize.find(id)
  end
end
