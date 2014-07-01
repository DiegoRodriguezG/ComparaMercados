class PublicController < ApplicationController

	def index
		@productos = Producto.find(:all).sample(5)
	end

	def ver_producto
		producto_id = params[:id]
  	@producto = Producto.find producto_id
	end
end
