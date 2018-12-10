require_relative '../Services.rb'
require_relative 'validate_request.rb'

class Validate < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.validate_xml(xml)
		SwValidate::validate_xml(Services::get_url, Services::get_token, xml)
	end

	def self.validate_LRFC(rfc)
		SwValidate::validate_LRFC(Services::get_url, Services::get_token, rfc)
	end

	def self.validate_LCO(numero_certificado)
		SwValidate::validate_LCO(Services::get_url, Services::get_token, numero_certificado)
	end
end
