require_relative '../Services.rb'
require_relative 'issue_request.rb'

class Issue < Services
	def self.set(params)
		Services::set_data(params)
	end
	def self.issue_v1(xml, b64 = false)
		SwIssue::issue(Services::get_url, Services::get_token, 'v1', xml, b64)
	end
	def self.issue_v2(xml, b64 = false)
		SwIssue::issue(Services::get_url, Services::get_token, 'v2', xml, b64)
	end
	def self.issue_v3(xml, b64 = false)
		SwIssue::issue(Services::get_url, Services::get_token, 'v3', xml, b64)
	end
	def self.issue_v4(xml, b64 = false)
		SwIssue::issue(Services::get_url, Services::get_token, 'v4', xml, b64)
	end
	def self.issue_JSON_v1(json)
		SwIssue::issue_JSON(Services::get_url, Services::get_token, 'v1', json)
	end
	def self.issue_JSON_v2(json)
		SwIssue::issue_JSON(Services::get_url, Services::get_token, 'v2', json)
	end
	def self.issue_JSON_v3(json)
		SwIssue::issue_JSON(Services::get_url, Services::get_token, 'v3', json)
	end
	def self.issue_JSON_v4(json)
		SwIssue::issue_JSON(Services::get_url, Services::get_token, 'v4', json)
	end
end
