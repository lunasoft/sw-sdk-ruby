require_relative '../Services.rb'#Clase Services.rb
require_relative 'ValidateRequest.rb'

class Validate < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.validateXml(cXML)
		SWvalidate::validatexml(Services::getUrl(), Services::getToken(), cXML)
	end

	def self.validateLrfc(cRFC)
		SWvalidate::validatelrfc(Services::getUrl(), Services::getToken(), cRFC)
	end

	def self.validateNoCert(cNoCert)
		SWvalidate::validatenocertificado(Services::getUrl(), Services::getToken(), cNoCert)
	end
end