Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['0123456789'], ENV['7f49b2f2af5e40c83f8056a6fcf370f2']
end