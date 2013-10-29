class HomeController < ApplicationController
  def index
  end

  def search
    @results = Search.with_facebook_user(params[:q])
  end
end
