class User < ActiveRecord::Base
  attr_accessible :name, :image, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_image

  def crop_image
  	image.recreate_versions! if crop_x.present?
	end
end
