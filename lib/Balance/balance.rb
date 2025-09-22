require_relative '../Services.rb'
require_relative '../Balance/balance_request.rb'
require_relative 'balance_request.rb'

class Balance < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.get_balance()
		return SwAccountBalance::account_balance(Services::get_url_api, Services::get_token)
	end

	def self.add_stamps(userId, stamps, comment)
		return SwAccountBalance::stamp_distribution(Services::get_url_api, Services::get_token, userId, stamps, comment,"Add")
	end

	def self.remove_stamps(userId, stamps, comment)
		return SwAccountBalance::stamp_distribution(Services::get_url_api, Services::get_token, userId, stamps, comment,"Remove")
	end
end
