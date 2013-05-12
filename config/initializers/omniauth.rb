Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "155431544630724", "d119af971ec9cacafca84ba43a5d4c05"
end