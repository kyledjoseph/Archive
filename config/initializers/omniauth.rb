OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '288951697879816', 'bd5edbbe65daab4ece449644e84fa45d'
    provider :google_oauth2, '770043696881.apps.googleusercontent.com', '01GUHPahZY6KIfDbOF4ge9Kq'
    provider :identity, on_failed_registration: lambda { |env|    
        IdentitiesController.action(:new).call(env)
    }
end