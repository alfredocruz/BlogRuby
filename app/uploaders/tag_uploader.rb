# encoding: utf-8

class TagUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

   include Cloudinary::CarrierWave
   # Allowed image format
   def extension_white_list
        %w(jpg jpeg gif png)
   end
end
