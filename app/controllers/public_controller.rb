class PublicController < ApplicationController

	def index
		@productos = Producto.find(:all).sample(5)
	end

	def ver_producto
		producto_id = params[:id]
  	@producto = Producto.find producto_id
	end

	def agregar_producto
		cookies[:id] = params[:id]
		redirect_to root_path
	end
end
