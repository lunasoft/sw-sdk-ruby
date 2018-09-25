require_relative '../Services.rb'
require_relative 'RelationsRequest.rb'

class Relations < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.RelationsCsd(cUUID, cRFC, cPasswordCSD, cB64CSD, cB64Key)
		return SWrelations::relationsbycsd(Services::getUrl(), Services::getToken(), cUUID, cRFC, cPasswordCSD, cB64CSD, cB64Key)
	end

	def self.RelationsUuid(cUUID, cRFC)
		return SWrelations::relationsbyuuid(Services::getUrl, Services::getToken(), cUUID, cRFC)
	end

	def self.RelationsPfx(cUUID, cRFC, cPassword, cB64PFX)
		return SWrelations::relationsbypfx(Services::getUrl(), Services::getToken(), cUUID, cRFC, cPassword, cB64PFX)
	end

	def self.RelationsXml(cXML)
		return SWrelations::relationsbyxml(Services::getUrl(), Services::getToken(), cXML)
	end
end