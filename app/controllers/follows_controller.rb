class FollowsController < ApplicationController
  before_action :set_follow, only: [:destroy]

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(follow_params)
    respond_to do |format|
      if @follow.save
        format.js
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:follower_id, :followed_id)
    end
end
