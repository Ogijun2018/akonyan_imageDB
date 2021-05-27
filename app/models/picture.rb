class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  is_impressionable counter_cache: true
  has_one_attached :avatar
end