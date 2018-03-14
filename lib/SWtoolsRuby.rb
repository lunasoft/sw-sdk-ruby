# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'openssl'
require 'base64'
require 'nokogiri'

class SWTools
    # Generar Cadena Original
    
  def self.genera_cadena_original(xml)
  
    document = Nokogiri::XML( File.open(xml))
    template = Nokogiri::XSLT( File.open('./resources/xslt/cadenaoriginal_3_3.xslt'))
    transformed_document = template.transform(document).to_s.gsub('<?xml version="1.0" encoding="UTF-8"?>' ,'')
    
    return transformed_document
  end
    
  # Para crear el archivo PFX necesitaremos la contraseña, archivo Key, Certificado y el nombre de salida
  def self.crear_pfx(pass, key, cert, out)
    key    = OpenSSL::PKey.read File.read(key)
    cert   = OpenSSL::X509::Certificate.new File.read(cert)
    name   = nil
    pkcs12 = OpenSSL::PKCS12.create(pass, name, key, cert)
    if  File.open(out, 'w'){|f| f << pkcs12.to_der }
      return "Archivo creado correctamente con el nombre: #{out}"
    else
      return "Sucedio un error, es posible que exista un problema de correspondencia entre los certificados y contraseñas"
    end
  end
    
  # Se necesitará proporcionar la ruta del archivo y la contraseña
  def self.crear_key_pem(key)
    key = OpenSSL::PKey.read File.read(key)
    
    
    
  end

  # 
  def self.crear_cer_pem()

  end

  # 
  def self.sello_digital()

  end
end
