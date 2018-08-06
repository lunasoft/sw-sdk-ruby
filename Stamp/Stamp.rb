require_relative '../Services.rb'
require_relative 'StampRequest.rb'

class Stamp < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.stampV1(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v1', xml)
	end
	def self.stampV1b64(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v1', xml, true)
	end
	def self.stampV2(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v2', xml)
	end
	def self.stampV2b64(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v2', xml, true)
	end
	def self.stampV3(xml, b64 = false)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v3', xml)
	end
	def self.stampV3b64(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v3', xml, true)
	end
	def self.stampV4(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v4', xml)
	end
	def self.stampV4b64(xml)
		SWstamp::stamp(Services::getUrl(), Services::getToken(), 'v4', xml, true)
	end
	def self.stampJsonV1(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v1', xml)
	end
	def self.stampJsonV1b64(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v1', xml, true)
	end
	def self.stampJsonV2(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v2', xml)
	end
	def self.stampJsonV2b64(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v2', xml, true)
	end
	def self.stampJsonV3(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v3', xml)
	end
	def self.stampJsonV3b64(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v3', xml, true)
	end
	def self.stampJsonV4(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v4', xml)
	end
	def self.stampJsonV4b64(xml)
		SWstamp::stampJson(Services::getUrl(), Services::getToken(), 'v4', xml, true)
	end
	def self.issueV1(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v1', xml)
	end
	def self.issueV1b64(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v1', xml, true)
	end
	def self.issueV2(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v2', xml)
	end
	def self.issueV2b64(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v2', xml, true)
	end
	def self.issueV3(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v3', xml)
	end
	def self.issueV3b64(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v3', xml, true)
	end
	def self.issueV4(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v4', xml)
	end
	def self.issueV4b64(xml)
		SWstamp::issue(Services::getUrl(), Services::getToken(), 'v4', xml, true)
	end
	def self.issueJsonV1(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v1', xml)
	end
	def self.issueJsonV1b64(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v1', xml, true)
	end
	def self.issueJsonV2(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v2', xml)
	end
	def self.issueJsonV2b64(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v2', xml, true)
	end
	def self.issueJsonV3(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v3', xml)
	end
	def self.issueJsonV3b64(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v3', xml, true)
	end
	def self.issueJsonV4(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v4', xml)
	end
	def self.issueJsonV4b64(xml)
		SWstamp::issueJson(Services::getUrl(), Services::getToken(), 'v4', xml, true)
	end

end
