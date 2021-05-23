class MytweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @q = Tweet.ransack(params[:q])
    if signed_in?
    @tweets = Tweet.where(:user_id => current_user).order("created_at DESC").page(params[:page])
    else
    @tweets = Tweet.all.order("created_at ASC").page(params[:page])
    end
  
    if params[:tweetsearch].present?
      @tweets = Tweet.search_my_tweets(params[:tweetsearch]).page(params[:page]).order("created_at DESC")
    elsif params[:hashtag].present?
      @tweets = Tweet.search_my_tweets("##{params[:hashtag]}").page(params[:page]).order("created_at DESC")
    
      
    end
  end

  

  
  

end
