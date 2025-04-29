# Força URL correta mesmo fora de contexto de request
Rails.application.config.after_initialize do
  ActiveStorage::Current.url_options = {
    host: ENV.fetch("RAILS_HOST", "localhost"),
    protocol: ENV.fetch("RAILS_PROTOCOL", "https")
  }
end
