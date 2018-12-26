require_relative '../Services.rb'
require_relative 'csd_request.rb'

class Csd < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.upload_csd(is_active, certificate_type, password, csd, key)
		return SwCsd::upload_csd(Services::get_url, Services::get_token, is_active, certificate_type, password, csd, key)
	end
end
