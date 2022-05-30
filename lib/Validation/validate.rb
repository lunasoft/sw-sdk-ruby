require_relative '../Services.rb'
require_relative 'validate_request.rb'

class Validate < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.validate_xml(xml)
		SwValidate::validate_xml(Services::get_url, Services::get_token, xml)
	end
end
