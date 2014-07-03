class Producto < ActiveRecord::Base
	belongs_to :supermercado
	mount_uploader :imagen, ImagenUploader
end
