# -*- encoding : utf-8 -*-
namespace :obtener_datos do

	desc "obtener productos de unimarc"
	task obtener_productos_unimarc: :environment do

		begin

			supermercado = Supermercado.new
			supermercado.nombre = "Unimarc"
			supermercado.save

			data = Mechanize.new
			data.get("http://ofertas.unimarc.cl/portal/168")
			productos = data.page.search(".topofertas").map(&:text).map(&:strip)
			productos_imagenes = data.page.search(".fotooferta img")

			productos.to_enum.with_index.each do |producto, index|
				detalle = producto.split("\n")
				campos = []
				detalle.each{|p| campos << p.strip }

				nuevo_producto = Producto.new
				nuevo_producto.descripcion = campos[0] + ' ' + campos[1]
				nuevo_producto.remote_imagen_url = "http://ofertas.unimarc.cl" + productos_imagenes[index].attributes["src"].value
				nuevo_producto.precio = campos[3]
				nuevo_producto.supermercado = supermercado
				nuevo_producto.save
				puts "producto #{nuevo_producto.descripcion} perteneciente a #{supermercado} creado!"
			end

		rescue Exception => e
			puts "ERROR!"
			puts "Detalle: "
			puts e
		end

	end

end