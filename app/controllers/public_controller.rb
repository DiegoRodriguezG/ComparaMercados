class PublicController < ApplicationController

	def index
		unless params[:busqueda].blank?
			@productos = Producto.where("descripcion LIKE :busqueda", {busqueda: "%#{params[:busqueda]}%"})
		else
			@productos = Producto.find(:all).sample(5)
		end
	end

	def ver_producto
		producto_id = params[:id]
  	@producto = Producto.find producto_id
	end

	def agregar_producto

		if cookies[:id].nil?
			cookies[:id] = params[:id]
		else
			cookies[:id] = cookies[:id].split << params[:id]
		end
		
		redirect_to root_path
	end

	def comparador
		if cookies[:id].nil?
			redirect_to root_path
		else
			@productos = Producto.find cookies[:id].split('&')
		end
	end
end
