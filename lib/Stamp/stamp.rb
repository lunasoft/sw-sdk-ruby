require_relative '../Services.rb'
require_relative 'stamp_request.rb'
class Stamp < Services
	def self.set(params)
		Services::set_data(params)
	end
	def self.stamp_v1(xml, b64 = false)
		SwStamp::stamp(Services::get_url, Services::get_token, 'v1', xml, b64)
	end
	def self.stamp_v2(xml, b64 = false)
		SwStamp::stamp(Services::get_url, Services::get_token, 'v2', xml, b64)
	end
	def self.stamp_v3(xml, b64 = false)
		SwStamp::stamp(Services::get_url, Services::get_token, 'v3', xml, b64)
	end
	def self.stamp_v4(xml, b64 = false)
		SwStamp::stamp(Services::get_url, Services::get_token, 'v4', xml, b64)
	end
end
