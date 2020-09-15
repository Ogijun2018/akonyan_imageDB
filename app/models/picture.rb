class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
end