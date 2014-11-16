class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topics_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "There was an error saving this topic. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topics_params)
      redirect_to @topic
    else
      flash[:error] = "There was an error updating this topic"
      render :edit
    end
  end

  private

  def topics_params
    params.require(:topic).permit(:name, :description, :public)
  end

end