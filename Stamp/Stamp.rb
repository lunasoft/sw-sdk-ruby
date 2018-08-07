require_relative '../Services.rb'
require_relative 'StampRequest.rb'

class Stamp < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.stampV1(xml, b64 = false)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v1', xml, b64)
	end
	def self.stampV2(xml, b64 = false)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v2', xml, b64)
	end
	def self.stampV3(xml, b64 = false)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v3', xml, b64)
	end
	def self.stampV4(xml, b64 = false)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v4', xml, b64)
	end
	def self.stampJsonV1(xml, b64 = false)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v1', xml, b64)
	end
	def self.stampJsonV2(xml, b64 = false)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v2', xml, b64)
	end
	def self.stampJsonV3(xml, b64 = false)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v3', xml, b64)
	end
	def self.stampJsonV4(xml, b64 = false)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v4', xml, b64)
	end

end
