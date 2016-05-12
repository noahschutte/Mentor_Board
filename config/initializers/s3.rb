CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_acl    = 'public-read'

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => '<your key goes here>',
    :aws_secret_access_key  => '<your secret key goes here>',
    :region                 => 'us-east-1'                        # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'S3_BUCKET_NAME'
end