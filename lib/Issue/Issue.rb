require_relative '../Services.rb'
require_relative 'IssueRequest.rb'

class Issue < Services
	def self.set(params)
		Services::setData(params)
	end
	def self.issueV1(xml, b64 = false)
		SWissue::issue(Services::getUrl(), Services::getToken(), 'v1', xml, b64)
	end
	def self.issueV2(xml, b64 = false)
		SWissue::issue(Services::getUrl(), Services::getToken(), 'v2', xml, b64)
	end
	def self.issueV3(xml, b64 = false)
		SWissue::issue(Services::getUrl(), Services::getToken(), 'v3', xml, b64)
	end
	def self.issueV4(xml, b64 = false)
		SWissue::issue(Services::getUrl(), Services::getToken(), 'v4', xml, b64)
	end
	def self.issueJsonV1(json, b64 = false)
		SWissue::issueJson(Services::getUrl(), Services::getToken(), 'v1', json, b64)
	end
	def self.issueJsonV2(json, b64 = false)
		SWissue::issueJson(Services::getUrl(), Services::getToken(), 'v2', json, b64)
	end
	def self.issueJsonV3(json, b64 = false)
		SWissue::issueJson(Services::getUrl(), Services::getToken(), 'v3', json, b64)
	end
	def self.issueJsonV4(json, b64 = false)
		SWissue::issueJson(Services::getUrl(), Services::getToken(), 'v4', json, b64)
	end
end