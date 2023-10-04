require 'nokogiri'
require 'openssl'
require 'base64'

class CertificateHelper
    def self.get_certificate(pfx, password)
        pfx_pkcs = OpenSSL::PKCS12.new(pfx, password)
        cert = pfx_pkcs.certificate
        return Base64.strict_encode64(cert.to_der)
    end
    def self.get_numero_certificado(cert_b64)
        cert_der = Base64.decode64(cert_b64)
        cert = OpenSSL::X509::Certificate.new(cert_der)
        serial_number = cert.serial.to_s(16)
        result = ""
        serial_number.each_char.each_slice(2) do |pair|
        result << pair.join.to_i(16).chr
        end
        return result
    end
    def self.create_pfx(certificate, private_key, password)
        cert = OpenSSL::X509::Certificate.new(certificate)
        pkey = OpenSSL::PKey::RSA.new(private_key, password)
        pfx = OpenSSL::PKCS12.create(password, "certificate", pkey, cert)
        return pfx.to_der
    end
end
