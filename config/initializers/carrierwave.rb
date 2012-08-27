require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJNU5CLXDPYM3ZZVQ',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'billyup-feedback'
end
