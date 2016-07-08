class UsersController < ApplicationController
	before_action :admin_check, only: [:index, :update, :destroy, :show]


	def index
		@user = User.paginate(:page => params[:page], :per_page => 25).order(id: :desc)
		@side = false
	end

  def show
    @user = User.find(params[:id])
    @user_comments = Comment.where(user_id: @user.id)
  end

	def update
		@user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private

	def user_params
      params.require(:user).permit(:id, :admin, :editor)
    end

	def admin_check
      if current_user.admin === false
        redirect_to :root
      end
    end
end
