OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '477136309011490', '4d97cc17e5fe0cef91b6059cd33728a9'
end