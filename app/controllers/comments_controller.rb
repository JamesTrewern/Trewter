class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.profile = current_user.profile
    respond_to do |format|
      if @comment.save
        format.js   { flash[:notice] = 'added comment'}
      else
        format.js   { flash[:notice] = 'could not add comment'}
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js
      else
        format.js{ flash[:notice] = 'could not edit comment'}
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.js   { flash[:notice] = 'comment destroyed'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :profile_id, :comment_text)
    end
end
