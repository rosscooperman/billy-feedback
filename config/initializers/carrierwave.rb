require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if RACK_ENV.to_sym == :production
    config.storage         = :fog
    config.fog_directory   = 'billyup-feedback'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJNU5CLXDPYM3ZZVQ',
      :aws_secret_access_key  => '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'
    }
  else
    config.root = "#{APP_ROOT}/public"
    config.storage = :file
  end
end
