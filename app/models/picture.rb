class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  is_impressionable counter_cache: true
end