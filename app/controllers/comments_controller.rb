class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def show
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def create
    @commentable = find_commentable
    @comment = current_user.comments.new(post_params, :commentable => @commentable)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :id => nil, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: nil }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to :id => nil, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: nil }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_post
    @comment = Comment.find(params[:id])
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end

end
