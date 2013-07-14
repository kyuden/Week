if Rails.env == 'development'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "127760774049676", "a1ac8a91d99f1aa0a75577a45c212197"
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "155431544630724", "d119af971ec9cacafca84ba43a5d4c05"
  end
end