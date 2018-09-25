require_relative 'StatusCfdiRequest.rb'

class StatusCfdi
	def self.Status(cRFCEmisor, cRFCReceptor, cTotal, cUUID, cURL, cAction)
		return SWstatuscfdi::status(cURL, cAction, cRFCEmisor, cRFCReceptor, cTotal,cUUID)
	end
end