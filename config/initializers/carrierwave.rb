
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Setting.aws_access_key_id,
    :aws_secret_access_key  => Setting.aws_secret_access_key,
    :region                 => Setting.aws_region_carrierwave
  }
  config.fog_directory  = Setting.aws_bucket_carrierwave
  config.asset_host     = "http://" + Setting.aws_host_carrierwave
  config.fog_public     = true
end



# Fix carrierwave-meta + fog
module CarrierWave
  module Storage
    class Fog
      class File
        def original_filename
          ::File.basename(path)
        end
      end
    end
  end
end
