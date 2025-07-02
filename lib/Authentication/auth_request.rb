require_relative 'auth_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwAuthentication
  def self.authentication(url, user, password)
    endpoint = URI(url + "/v2/security/authenticate")
    payload = {'user': user, 'password': password}
    response = RequestHelper.post_json_request_without_token(endpoint,payload)
    response_obj = AuthResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end
