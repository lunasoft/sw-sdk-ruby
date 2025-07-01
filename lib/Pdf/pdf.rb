require_relative '../Services.rb'
require_relative '../Pdf/pdf_request.rb'
require_relative 'pdf_request.rb'

class Pdf < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.generate_pdf(xml, template_id,b64Logo = nil, extras = nil)
		return SWPdf::pdf(Services::get_url_api, Services::get_token, xml, template_id,b64Logo,extras)
	end
end
