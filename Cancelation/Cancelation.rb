require_relative '../Services.rb'
require_relative 'CancelationRequest.rb'

class Cancelation < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.cancelCsd(cUUID, cRFC, cPasswordCSD, cB64CSD, cB64Key)
		return SWcancelation::cancelbycsd(Services::getUrl(), Services::getToken(), cUUID, cRFC, cPasswordCSD, cB64CSD, cB64Key)
	end

	def self.cancelUuid(cRFC, cUUID)
		return SWcancelation::cancelbyuuid(Services::getUrl, Services::getToken(), cRFC, cUUID)
	end

	def self.cancelPfx(cUUID, cRFC, cPassword, cB64PFX)
		return SWcancelation::cancelbypfx(Services::getUrl(), Services::getToken(), cUUID, cRFC, cPassword, cB64PFX)
	end

	def self.cancelXml(cXML)
		return SWcancelation::cancelbyxml(Services::getUrl(), Services::getToken(), cXML)
	end
end