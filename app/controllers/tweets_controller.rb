class TweetsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @tweets = Current.user.tweets
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Current.user.tweets.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice: 'Tweet scheduled successfully'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            redirect_to tweets_path, notice: 'Tweet updated successfully'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to tweets_path, notice: 'Tweet unscheduled successfully'
    end
    
    private
    
    def tweet_params
        params.require(:tweet).permit(:twitter_account_id,:body, :publish_at)
    end
end