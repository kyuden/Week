class HomeController < ApplicationController
  def index
    if current_user
      @art =  "article"
    else
      render template: 'home/login', layout: false
    end
  end
end
