if Rails.env == 'development'
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
else
  Rails.application.routes.default_url_options[:host] = "week-kyuden.herokuapp.com"
end
