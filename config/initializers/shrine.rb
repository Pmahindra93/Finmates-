# require "shrine"
# require "shrine/storage/file_system"

# Shrine.storages = {
#   cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
#   store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
# }

# Shrine.plugin :activerecord
# Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
# Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file

require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: "dvscdtpyl",
  api_key:    "581579419931912",
  api_secret: "GiDIqUEiqumYXmOZXM1xIVMf3AC",
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new,
}
