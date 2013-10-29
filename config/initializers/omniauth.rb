OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :linkedin, "0ctqnsczmz3a", "k184ZjS6JhEyq7os"
  provider :facebook, "169657853232002", "50e4c34644fff3cad51d8bc0e5255b37"
end
