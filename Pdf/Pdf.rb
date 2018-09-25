require_relative '../Services.rb'
require_relative 'PdfRequest.rb'

class Pdf < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.generatePDF(cXml, cTemplateId = nil, cExtras = nil)
		return SWpendings::pendings(Services::getUrl(), Services::getToken(), cRFC)
	end
end