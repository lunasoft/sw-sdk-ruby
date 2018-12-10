require_relative '../Services.rb'
require_relative 'pendings_request.rb'

class Pendings < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.get_pendings(rfc)
		return SwPendings::pendings(Services::get_url, Services::get_token, rfc)
	end
end
