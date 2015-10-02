class PostsController < ApplicationController

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post= Post.new
    authorize @post
  end

  def create
   @topic = Topic.find(params[:topic_id])
   @post = Post.new(post_params)
     @post.user = current_user
     @post.topic = @topic
     authorize @post

     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

   def update
   @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:id])
   if @post.update_attributes(post_params)
     flash[:notice] = "Post was updated."
     redirect_to [@topic, @post]
   else
     flash[:error] = "There was an error saving the post. Please try again."
     render :edit
   end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
      authorize @post
 
      if @post.destroy
        flash[:notice] = "\"#{@post.title}\" was deleted successfully."
        redirect_to @topic
      else
        flash[:error] = "There was an error deleting the post."
        render :show
      end
    end

 end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
