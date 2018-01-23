CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Setting.aws_access_key_id,
      aws_secret_access_key: Setting.aws_secret_access_key,
      region:                Setting.aws_region,
      endpoint:              Setting.aws_endpoint
  }
  config.fog_directory  = Setting.aws_fog_directory
end
