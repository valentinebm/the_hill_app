OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id,
  Rails.application.secrets.facebook_app_secret,
  scope: 'email, public_profile', info_fields: 'id,first_name,last_name,age_range,link,picture,locale,email,gender'

end
