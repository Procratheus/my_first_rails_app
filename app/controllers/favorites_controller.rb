class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    @topic = @post.topic

    if favorite.save
      flash[:notice] = "You favorited this post"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error favoriting this post. Please try again"
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find(params[:id])
    authorize favorite
    @topic = @post.topic

    if favorite.destroy
      flash[:notice] = "You unfavorited this post"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error unfavoriting the post. Please try again"
      redirect_to [@topic, @post]
    end
  end

end
