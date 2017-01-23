Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
#     scope: 'email,user_birthday,read_stream', display: 'popup'

#   config.omniauth :facebook, "APP_ID", "APP_SECRET", :strategy_class =>
#     OmniAuth::Strategies::Facebook
#   config.omniauth :digitalocean, "APP_ID", "APP_SECRET", :strategy_class =>
#     OmniAuth::Strategies::Digitalocean
    # config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], scope: "email"
#   use OmniAuth::Builder do
#   provider :facebook, ENV['APP_ID'], ENV['APP_SECRET'],
#     client_options: {
#       site: 'https://graph.facebook.com/v3.0',
#       authorize_url: "https://www.facebook.com/v3.0/dialog/oauth"
#     }
# end
end
