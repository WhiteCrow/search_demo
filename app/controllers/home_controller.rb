class HomeController < ApplicationController
  def index
  end

  def search
    redirect_to action: :index
  end
end
