require_relative 'status_cfdi_request.rb'

class StatusCfdi
	def self.status(rfc_emisor, rfc_receptor, total, uuid, url, action)
		return SwStatusCfdi::status(url, action, rfc_emisor, rfc_receptor, total, uuid)
	end
end