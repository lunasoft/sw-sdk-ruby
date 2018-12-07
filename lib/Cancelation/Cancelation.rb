require_relative '../Services.rb'
require_relative 'cancelation_request.rb'

class Cancelation < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.cancel_csd(uuid, rfc, password, csd, key)
		return SwCancelation::cancel_csd(Services::get_url, Services::get_token, uuid, rfc, password, csd, key)
	end

	def self.cancel_uuid(uuid, rfc)
		return SwCancelation::cancel_uuid(Services::get_url, Services::get_token, uuid, rfc)
	end

	def self.cancel_pfx(uuid, rfc, password, pfx)
		return SwCancelation::cancel_pfx(Services::get_url, Services::get_token, uuid, rfc, password, pfx)
	end

	def self.cancel_xml(xml)
		return SwCancelation::cancel_xml(Services::get_url, Services::get_token, xml)
	end
end