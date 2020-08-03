class Photo < ApplicationRecord
  include FigureUploader::Attachment(:image)
end
