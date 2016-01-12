# encoding: utf-8

class ArticleUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

   include Cloudinary::CarrierWave
   #esta imagen es la del los recuadros del index
   version :index_cards do
       process resize_to_fill: [200, 100]
   end
   #primer dato anchura[anchura,altura]
   version :index_slider do
       process resize_to_fill: [600, 300]
   end
   #imagen de articles show
   version :show do
       process resize_to_fill: [300, 100]
   end
   # Crop to 275px, 206px
   version :thumbnail do
       process resize_to_fill: [275, 206]
   end

   # crop to 62px, 62px
   version :mini_tumbnail do
       process resize_to_fill: [62, 62]
   end

   # crop to 870px, 261px
   version :detail do
       process resize_to_fill: [870, 261]
   end

   # Allowed image format
   def extension_white_list
        %w(jpg jpeg gif png)
   end
end
