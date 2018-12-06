require_relative '../Services.rb'
require_relative 'accept_reject_request.rb'

class AcceptReject < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.accept_reject_csd(uuids, rfc, password, csd, key)
		return SwAcceptReject::accept_reject_csd(Services::get_url, Services::get_token, uuids, rfc, password, csd, key)
	end

	def self.accept_reject_uuid(uuid, rfc, action)
		return SwAcceptReject::accept_reject_uuid(Services::get_url, Services::get_token, uuid, rfc, action)
	end

	def self.accept_reject_pfx(uuids, rfc, password, pfx)
		return SwAcceptReject::accept_reject_pfx(Services::get_url, Services::get_token, uuids, rfc, password, pfx)
	end

	def self.accept_reject_xml(xml)
		return SwAcceptReject::accept_reject_xml(Services::get_url, Services::get_token, xml)
	end
end