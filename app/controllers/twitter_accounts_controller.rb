class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end
    def destroy
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
        @twitter_account.destroy
        flash[:success] = 'Twitter account deleted.'
        redirect_to twitter_accounts_url
    end
end
