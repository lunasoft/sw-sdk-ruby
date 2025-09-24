require_relative 'accountUser_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwAccountUser
  @@pathBase = "/management/v2/api/dealers/users"

  def self.get_users(urlApi, token, **params)
    endpoint = @@pathBase
    unless params.empty?
      endpoint += "/?" + URI.encode_www_form(params)
    end

    uri = URI.join(urlApi, endpoint)
    response = RequestHelper.get_json_request(uri, token)
    response_obj = AccountUserResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end


  def self.create_user(urlApi, token, name, taxId, email, stamps, isUnlimited, password, notificationEmail, phone)
    endpoint = URI(urlApi + @@pathBase)
    payload = {
      "name" => name,
      "taxId" => taxId,
      "email" => email,
      "stamps" => stamps,
      "isUnlimited" => isUnlimited,
      "password" => password,
      "notificationEmail" => notificationEmail,
      "phone" => phone
    }
    response = RequestHelper.post_json_request(endpoint, token, payload)
    response_obj = AccountUserResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.delete_user(urlApi, token, idUser)
    endpoint = URI(urlApi+ "#{@@pathBase}/#{idUser}")
    response = RequestHelper.delete_json_request(endpoint, token, nil)
    response_obj = AccountUserResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.update_user(urlApi, token, idUser, name, taxId, notificationEmail, phone, isUnlimited)
    endpoint = URI(urlApi+ "#{@@pathBase}/#{idUser}")
    payload = {
      "idUser" => idUser,
      "name" => name,
      "taxId" => taxId,
      "notificationEmail" => notificationEmail,
      "phone" => phone,
      "isUnlimited" => isUnlimited
    }
    response = RequestHelper.put_json_request(endpoint, token, payload)
    response_obj = AccountUserResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

end
