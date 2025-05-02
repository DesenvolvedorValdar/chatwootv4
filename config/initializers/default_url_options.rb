# Força as opções corretas de URL mesmo fora de contexto de request
Rails.application.routes.default_url_options = {
  host: ENV.fetch('RAILS_HOST', 'localhost'),
  protocol: ENV.fetch('RAILS_PROTOCOL', 'https')
}

ActiveStorage::Current.url_options = {
  host: ENV.fetch('RAILS_HOST', 'localhost'),
  protocol: ENV.fetch('RAILS_PROTOCOL', 'https')
}

