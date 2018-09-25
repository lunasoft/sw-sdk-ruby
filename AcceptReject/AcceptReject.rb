require_relative '../Services.rb'
require_relative 'AcceptRejectRequest.rb'

class AcceptReject < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.AcceptRejectCsd(cUUIDS, cRFC, cPasswordCSD, cB64CSD, cB64Key)
		return SWacceptreject::acceptrejectbycsd(Services::getUrl(), Services::getToken(), cUUIDS, cRFC, cPasswordCSD, cB64CSD, cB64Key)
	end

	def self.AcceptRejectUuid(cUUID, cRFC, cAction)
		return SWacceptreject::acceptrejectbyuuid(Services::getUrl, Services::getToken(), cUUID, cRFC, cAction)
	end

	def self.AcceptRejectPfx(cUUIDS, cRFC, cPassword, cB64PFX)
		return SWacceptreject::acceptrejectbypfx(Services::getUrl(), Services::getToken(), cUUIDS, cRFC, cPassword, cB64PFX)
	end

	def self.AcceptRejectXml(cXML)
		return SWacceptreject::acceptrejectbyxml(Services::getUrl(), Services::getToken(), cXML)
	end
end