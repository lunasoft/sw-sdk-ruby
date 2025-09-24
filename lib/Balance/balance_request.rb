require_relative 'balance_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwAccountBalance
  def self.account_balance(urlApi, token)
    endpoint = URI(urlApi + "/management/v2/api/users/balance")
    response = RequestHelper.get_json_request(endpoint,token)
    return BalanceResponse.new(response)
  end

  def self.stamp_distribution(urlApi,token, userId, stamps, comment, action)
    endpoint = URI(urlApi + "/management/v2/api/dealers/users/#{userId}/stamps")
    payload = {
      "stamps" => stamps,
      "comment" => comment
    }

    if action == "Add"
      response = RequestHelper.post_json_request(endpoint, token, payload)
    elsif action == "Remove"
      response = RequestHelper.delete_json_request(endpoint, token, payload)
    end

    return AccountBalanceResponse.new(response)
  end
end
