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

				productos.each do |producto|
					detalle = producto.split("\n")
					campos = []
					detalle.each{|p| campos << p.strip }

					nuevo_producto = Producto.new
					nuevo_producto.descripcion = campos[0] + ' ' + campos[1]
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

	desc "obtener productos solamente de categoría coctel de lider"
	task obtener_productos_unimarc: :environment do

		"http://www.lider.cl/walmart/catalog/category.jsp?id=CF_Nivel2_000012&pId=CF_Nivel1_000003&navAction=jump&navCount=0#categoryCategory=CF_Nivel2_000012&pageSizeCategory=20&currentPageCategory=1&currentGroupCategory=1&orderByCategory=lowestPrice&lowerLimitCategory=0&upperLimitCategory=0&&685"
	end

	desc "obtener productos de jumbo"
	task obtener_productos_unimarc: :environment do
		
		"http://www.jumbo.cl/FO/CategoryDisplay?cab=4008&int=6&ter=-1"
	end

end