class HomeController < ApplicationController
  def index
  end

  def search
    kw = params[:q].to_s
    ::Resque.enqueue(SearchJob,request.session_options[:id],kw)
    render :inline => 'ok'
    #linkedin_client = OAuth2::Client.new('0ctqnsczmz3a', 'k184ZjS6JhEyq7os', :site => 'https://www.linkedin.com')
    #token = client.auth_code.get_token('31e7f763-fa05-47e9-9302-d067a155d74c',
    #               :redirect_uri => 'http://localhost:8080/oauth2/callback',
    #               :headers => {'Authorization' => '6a33c211-09f0-48a6-99fc-19880665497a'})
    #binding.pry
    #client = FBGraph::Client.new(:client_id => '169657853232002',
    #                             :secret_id =>'50e4c34644fff3cad51d8bc0e5255b37')
    #result = client.search.query('facebook').on('page').info!
    #@results = params[:q].blank? ? [] : Search.with_twitter_tweets(params[:q])
  end
end
