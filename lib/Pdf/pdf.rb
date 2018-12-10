require_relative '../Services.rb'
require_relative 'pdf_request.rb'

class Pdf < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.generate_pdf(xml, template_id = nil, extras = nil)
		return SWPdf::pdf(Services::get_url, Services::get_token, xml)
	end
end
