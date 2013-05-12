class HomeController < ApplicationController
  def index
    if current_user
      @article = Article.new
      @articles = Article.all
    else
      render template: 'home/login', layout: false
    end
  end
end
