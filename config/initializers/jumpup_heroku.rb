Jumpup::Heroku.configure do |config|
  config.app = 'mentions-on-twitter'
end if Rails.env.development?