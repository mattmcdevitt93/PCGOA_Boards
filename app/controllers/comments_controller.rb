class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :admin_check, only: [:index, :destroy]


  def index
      @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.save
    redirect_to :back
  end

  def destroy
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.find(params[:id])
    # @comment.destroy
      Comment.destroy(params[:id])
      redirect_to :back
  end

  def update
    if current_user.id === comment.user_id
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to post_url(@comment.post_id), notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # Testing

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content, :username, :comment_type)
    end
end

