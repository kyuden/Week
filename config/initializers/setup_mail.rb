if Rails.env == 'development'
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
elsif Rails.env == 'production'
  Rails.application.routes.default_url_options[:host] = "weekjp.com"
else
  Rails.application.routes.default_url_options[:host] = "week-kyuden-staging.herokuapp.com"
end
