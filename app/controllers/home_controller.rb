class HomeController < ApplicationController
  def index
  end

  def search
    kw = params[:q].to_s
    ::Resque.enqueue(SearchJob,'with_twitter_tweets',request.session_options[:id],kw)
    ::Resque.enqueue(SearchJob,'with_facebook_users',request.session_options[:id],kw)
    render :inline => 'ok'
  end
end
