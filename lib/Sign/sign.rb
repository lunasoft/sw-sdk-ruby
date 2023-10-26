require_relative 'sign_request.rb'
class Sign
    def self.sign_cfdi(xml, pfx, password)
        return SignService::sign_cfdi(xml, pfx, password)
    end

    def self.create_pfx(certificate, private_key, password)
        return SignService::create_pfx(certificate, private_key, password)
    end
end