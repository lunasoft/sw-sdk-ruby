require_relative '../Services.rb'
require_relative '../Storage/storage_request.rb'
require_relative '../Response/generic_response.rb'

class Storage < Services
    def self.set(params)
        Services::set_data(params)
    end

    def self.get_xml(uuid)
        SwStorage::get_xml_uuid(Services::get_url_api, Services::get_token, uuid)
    end
end