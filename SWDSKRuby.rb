# Libreria SW SDK Ruby
require 'rubygems'
require 'uri'
require 'net/http'
require 'json'


# Clase Autenticacion
class SWauthentication
  # Funcion de autenticaci&oacute;n, requiere URL, Usuario y Password
  def authentication(cUri, cUser, cPassword)
   url = URI(cUri+"/security/authenticate")

   http = Net::HTTP.new(url.host, url.port)

   request = Net::HTTP::Post.new(url)
   request["user"] = cUser
   request["password"] = cPassword
   request["Cache-Control"] = 'no-cache'

   response = http.request(request)
   return response.read_body

  end 
end
# Clase Timbrado/Emisi&oacute;n-Timbrado
class SWstamp
  # Funci&oacute;n de timbrado, recibe Strings URL, Token, Versi&oacute;n de timbrado, XML y bolean True/False base64
  def stamp(cURL, cToken, cVersion, cXML, cBase64)

    if cBase64 == true
      cBase64 = '/b64/' 
    else
      cBase64 = ''
    end

    url = URI(cURL+"/cfdi33/stamp/"+cVersion+cBase64)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="----=_Part_11_11939969.1490230712432"'
    request["Cache-Control"] = 'no-cache'
    request.body = "------=_Part_11_11939969.1490230712432\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n------=_Part_11_11939969.1490230712432--"

    response = http.request(request)
    puts response.read_body
  end
  # Funci&oacute;n de timbrado en JSON, recibe Strings URL, Token, Versi&oacute;n de timbrado, XML y bolean True/False base64
  def stampJSON(cUri, cToken, cVersion, cXML, c_base64)

    if c_base64 == true
      c_base64 = '/b64/' 
    else
      c_base64 = ''
    end

    url = URI(cUri+"/cfdi33/stamp/"+cVersion+c_base64)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+ cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    request.body = '{ "data": "'+cXML+'"}'

    response = http.request(request)
    return response.read_body
  end
  # Función de emisi&oacute;n-timbrado, recibe Strings URL, Token, Versi&oacute;n de timbrado, XML y bolean True/False base64
  def issue(cURL, cToken, cVersion, cXML, cBase64)

    if cBase64 == true
      cBase64 = '/b64/' 
    else
      cBase64 = ''
    end

    url = URI(cURL+"/cfdi33/issue/"+cVersion+cBase64)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="----=_Part_11_11939969.1490230712432"'
    request["Cache-Control"] = 'no-cache'
    request.body = "------=_Part_11_11939969.1490230712432\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n------=_Part_11_11939969.1490230712432--"

    response = http.request(request)
    puts response.read_body
  end
  # Función de emisi&oacute;n-timbrado en JSON, recibe Strings URL, Token, Versi&oacute;n de timbrado, XML y bolean True/False base64
  def issueJSON(cUri, cToken, cVersion, cXML, c_base64)

    if c_base64 == true
      c_base64 = '/b64/' 
    else
      c_base64 = ''
    end

    url = URI(cUri+"/cfdi33/issue/"+cVersion+c_base64)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+ cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    request.body = '{ "data": "'+cXML+'"}'

    response = http.request(request)
    return response.read_body
  end
end
# Clase Cancelaci&oacute;n
class SWcancelation
  # Cancelaci&oacute;n por UUID, recibe strings URL, Token, RFC Emisor, UUID
  def cancelByUUID(cURL, cToken, cRFC, cUUID )

    url = URI(cURL+"/cfdi33/cancel/"+cRFC+"/"+cUUID)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'

    response = http.request(request)
    return response.read_body 
  end
  # Cancelaci&oacute;n por CSD recibe strings URL, Token, UUID, RFC Emisor, Password, CSD en base64, Key en base64
  def cancelByCSD(cURL, cToken, cUUID, cRFC, cPassword, cB64CSD, cB64Key)

    url = URI(cURL+"/cfdi33/cancel/pfx")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "'+cUUID+'", "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Cer": "'+cB64CSD+'", "b64Key": "'+cB64Key+'"}'

    response = http.request(request)
    return response.read_body
  end
  # Cancelaci&oacute;n por PFX recibe strings URL, Token, UUID, RFC Emisor, Password, PFX en base64
  def cancelByPFX(cURL, cToken, cUUID, cRFC, cPassword, cB64PFX)

    url = URI(cURL+"/cfdi33/cancel/pfx")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "'+cUUID+'", "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Pfx": "'+cB64PFX+'"}'

    response = http.request(request)
    return response.read_body
  end
  # Cancelaci&oacute;n por XML recibe URL, Token, XML de Tipo Cancelación
  def cancelByXML(cURL, cToken, cXML)

    url = URI(cURL+"/cfdi33/cancel/xml")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["content"] = 'multipart/form-data'
    request["Cache-Control"] = 'no-cache'
    request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml.xml\"\r\nContent-Type: \r\n"+cXML+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

    response = http.request(request)
    return response.read_body  
  end
end
# Clase Estado de Cuenta
class SWaccountBalance
  # Estado de Cuenta recibe strins URL, Token
  def accountBalance(cURL, cToken)

    url = URI(cURL+"/account/balance")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'

    response = http.request(request)
    return response.read_body
  end
end
# Clase para Validaciones
class SWvalidate
  # Valida XML recibe strings URL, Token y XML
  def validateXML(cURL, cToken, cXML)

    url = URI(cURL+"/validate/cfdi33")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="----=_Part_3_6510431.1490229284095"'
    request["Cache-Control"] = 'no-cache'
    request.body = '------=_Part_3_6510431.1490229284095\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name="xml"; filename="33.xml"\r\n\r\n'+cXML+'\r\n------=_Part_3_6510431.1490229284095--  '

    response = http.request(request)
    return response.read_body
  end
  # Validar LRFC recibe strings URL, Token y LRFC
  def validateLRFC(cURL, cToken, cLRFC)

    url = URI(cURL+"/lrfc/"+cLRFC)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'

    response = http.request(request)
    return response.read_body
  end
  # Validar NoCertificado recibe strings URL, Token y NoCertificado
  def validateNoCertificado(cURL, cToken, cNoCert)

    url = URI(cURL+"/lco/"+cNoCert)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'

    response = http.request(request)
    return response.read_body
  end
end
