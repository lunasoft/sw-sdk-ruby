require_relative '../Services.rb'
require_relative 'relations_request.rb'

class Relations < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.relations_csd(uuid, rfc, password, csd, key)
		return SwRelations::relations_csd(Services::get_url, Services::get_token, uuid, rfc, password, csd, key)
	end

	def self.relations_uuid(uuid, rfc)
		return SwRelations::relations_uuid(Services::get_url, Services::get_token, uuid, rfc)
	end

	def self.relations_pfx(uuid, rfc, password, pfx)
		return SwRelations::relations_pfx(Services::get_url, Services::get_token, uuid, rfc, password, pfx)
	end
end
