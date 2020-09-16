class Picture < ApplicationRecord
  mount_uploaders :picture, PictureUploader
end