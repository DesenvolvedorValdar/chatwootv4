json.meta do
  json.total_count @attachments_count
end

json.payload @attachments do |attachment|
  json.message_id attachment.push_event_data[:message_id]
  json.thumb_url attachment.push_event_data[:thumb_url]

  # Correção aqui
  json.data_url URI.join(
    "#{ENV.fetch('RAILS_PROTOCOL', 'https')}://#{ENV.fetch('RAILS_HOST', 'localhost')}",
    Rails.application.routes.url_helpers.rails_blob_path(attachment.file, only_path: true)
  ).to_s

  json.file_size attachment.push_event_data[:file_size]
  json.file_type attachment.push_event_data[:file_type]
  json.extension attachment.push_event_data[:extension]
  json.width attachment.push_event_data[:width]
  json.height attachment.push_event_data[:height]
  json.created_at attachment.message.created_at.to_i
  json.sender attachment.message.sender.push_event_data if attachment.message.sender
end

