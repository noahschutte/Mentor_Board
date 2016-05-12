CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_acl    = 'public-read'

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
    :region                 => 'us-east-1' # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = ENV['S3_BUCKET_NAME']
end
