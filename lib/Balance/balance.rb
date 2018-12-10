require_relative '../Services.rb'
require_relative 'balance_request.rb'

class Balance < Services
	def self.set(params)
		Services::set_data(params)
	end

	def self.account_balance()
		return SwAccountBalance::account_balance(Services::get_url, Services::get_token)
	end
end
