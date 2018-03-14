# encoding: utf-8 
# Importamos la libreria de SW-Services y la libreria de JSON para el parseo
# require 'SW-Services'
require './lib/SWSDKRuby'
require 'json'
require 'base64'
require 'nokogiri'
require 'openssl'

# Asignamos los valores que enviaremos a nuestro servicio
URL = 'http://services.test.sw.com.mx' # URL de pruebas
User = 'demo' # Usuario
Password = '123456789' # Contraseña


# Enviamos los parametros al objeto dentro de la libreria SWauthentication
resultauth = SWauthentication::authentication(URL,User,Password)

# Creamos un objeto de tipo JSON para poder parsearlo
Token = JSON.parse(resultauth)

# Accedemos a la propiedad token que se encuentra dentro del Data
valuetoken = Token['data']['token']

# Obtenemos el valor del Token 
puts "Valor del Token: #{valuetoken}"


# Crearemos nuestra función para leer archivos binarios (XML, CSD, Key... etc)
def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

# Definimos nuestros parametros a utilizar
# Token = 'T2lYQ0t4L0RHVkR4dHZ5Nkk1VHNEakZ3Y0J4Nk9GODZuRyt4cE1wVm5tbXB3YVZxTHdOdHAwVXY2NTdJb1hkREtXTzE3dk9pMmdMdkFDR2xFWFVPUXpTUm9mTG1ySXdZbFNja3FRa0RlYURqbzdzdlI2UUx1WGJiKzViUWY2dnZGbFloUDJ6RjhFTGF4M1BySnJ4cHF0YjUvbmRyWWpjTkVLN3ppd3RxL0dJPQ.T2lYQ0t4L0RHVkR4dHZ5Nkk1VHNEakZ3Y0J4Nk9GODZuRyt4cE1wVm5tbFlVcU92YUJTZWlHU3pER1kySnlXRTF4alNUS0ZWcUlVS0NhelhqaXdnWTRncklVSWVvZlFZMWNyUjVxYUFxMWFxcStUL1IzdGpHRTJqdS9Zakw2UGRiMTFPRlV3a2kyOWI5WUZHWk85ODJtU0M2UlJEUkFTVXhYTDNKZVdhOXIySE1tUVlFdm1jN3kvRStBQlpLRi9NeWJrd0R3clhpYWJrVUMwV0Mwd3FhUXdpUFF5NW5PN3J5cklMb0FETHlxVFRtRW16UW5ZVjAwUjdCa2g0Yk1iTExCeXJkVDRhMGMxOUZ1YWlIUWRRVC8yalFTNUczZXdvWlF0cSt2UW0waFZKY2gyaW5jeElydXN3clNPUDNvU1J2dm9weHBTSlZYNU9aaGsvalpQMUxnRGQ3ZmtFTGNDYkdmbFJxUUdwK0RYdityM1BXamhmcFowNGtZaHFSZ3l6OCtqajFVZUo1Kzh3U3h3L1pJYW5zSC9YV3V1Rm5Jb252Ylo5QnJSRHBuT2ZLYXRMQUh4KzlIblh1NE5aMXRPejFOekhlT29qTzNZN1dDcGFsTzllems4MGNJK3FqY2libXNtcTQxeVhiY009.DnD-XtN7xgjQ608z33g6M7mFMgSQENoaL50YKH9VYtA'
XML = read_file("./resources/basico.xml")
Version = 'v1'
B64 = false


# Obtenemos el valor de nuestra petición
puts "Timbrado: #{SWstamp::stamp(URL, valuetoken, Version, XML, B64)}"


# Definimos todos los parametros para los diferentes tipos de cancelacions
B64Cert = Base64.encode64(read_file("./resources/certificados/CSD_Pruebas_CFDI_LAN7008173R5.cer"))
B64Key = Base64.encode64(read_file("./resources/certificados/CSD_Pruebas_CFDI_LAN7008173R5.key"))
#B64Pfx = Base64.encode64(read_file("./resources/certificados/CSD_Pruebas_CFDI_LAN7008173R5.pfx"))
PasswordKey = '12345678a'
RFC = 'LAN7008173R5'
UUID = '06A46E4B-B154-4C12-BB77-F9A63ED55FF2'
XMLCancelation = ''


# Llamamos el metódo de cancelación por CSD
puts "Cancelaci&oacute;n por CSD: #{SWcancelation::cancelbycsd(URL, valuetoken, UUID, RFC, PasswordKey, B64Cert, B64Key )}"


# Llamamos el metódo de cancelación por XML
puts "Cancelaci&oacute;n por XML: #{SWcancelation::cancelbyxml(URL, valuetoken, XMLCancelation)}"


# Llamamos el metódo de cancelación por UUID
puts "Cancelaci&oacute;n por UUID: #{SWcancelation::cancelbyuuid(URL, valuetoken, RFC, UUID)}"


# Definimos parametros para poder consumir cancelación por PFX
#puts "Cancelaci&oacute;n por CSD #{SWcancelation::cancelbypfx(URL, valuetoken, UUID, RFC, PasswordKey, B64Pfx)}"


# Llamamos el metodo de Estado de cuenta
puts "Estado de cuenta: #{SWaccountBalance::accountbalance(URL, valuetoken)}"


# Llamamos la clase de Validaciones
# definimos los valores
LRFC = 'XAXX010101000'
NoCertificado = '20001000000300022816'


# Consumimos el servicio de Validación de XML
puts "Validación de XML:  #{SWvalidate::validatexml(URL, valuetoken, XML)}"


# Consumimos el servicio de validación de LRFC
puts "Validación de LRFC: #{SWvalidate::validatelrfc(URL, valuetoken, LRFC)}"

# Consumimos el servicio de validación de NoCertificado
puts "Validación de NoCertificado: #{SWvalidate::validatenocertificado(URL, valuetoken, NoCertificado)}"


# Generar Cadena Original
document = Nokogiri::XML( File.open('./resources/basico33.xml'))
template = Nokogiri::XSLT( File.open('./resources/xslt/cadenaoriginal_3_3.xslt'))
transformed_document = template.transform(document).to_s.gsub('<?xml version="1.0" encoding="UTF-8"?>' ,'')

puts "Cadena Original:  #{transformed_document}"

