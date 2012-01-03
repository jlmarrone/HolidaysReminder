# Load config/paperclip.yml settings
if paperclip_cfg = YAML.load_file("#{Rails.root}/config/paperclip.yml")[Rails.env]
  paperclip_cfg.symbolize_keys!
  command_path = paperclip_cfg.delete(:command_path)

  # Replace Attachment defaults with configuration ones
  Paperclip::Attachment.default_options.merge!(paperclip_cfg)

  # S3 credentials
  Paperclip::Attachment.default_options.merge!(:s3_credentials => Rails.root.join('config', 's3.yml'))

  # Adjust ImageMagick path to work with Passenger
  Paperclip.options[:command_path] = command_path

  Paperclip.interpolates(:normalized_basename) do |attachment, style|
   attachment.original_filename.gsub(File.extname(attachment.original_filename), "").gsub(/[^A-Za-z0-9_-]/, '_')
  end
end