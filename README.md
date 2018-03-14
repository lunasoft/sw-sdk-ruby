[![Smarter Web](http://sw.com.mx/images/logo.png)](http://sw.com.mx/)

# SDK Ruby

## Dependencias
Librerias:
* net/http
* uri

## Instalaci&oacute;n
Agregar manualmente la gema a nuestro proyecto

## Uso rapido
* Autenticación básica por Usuario y contrase&ntilde;a

```
# Importamos la libreria de SW-Services y la libreria de JSON para el parseo
require './SWSDKRuby'
require 'json'

# Asignamos los valores que enviaremos a nuestro servicio
URL = 'http://services.test.sw.com.mx'
User = 'demo'
Password = '123456789'


# Enviamos los parametros al objeto dentro de la libreria SWauthentication
resultAuth = SWauthentication::authentication(URL,User,Password)

# Creamos un objeto de tipo JSON para poder parsearlo
Token = JSON.parse(resultAuth)

# Accedemos a la propiedad token que se encuentra dentro del Data
valueToken = Token['data']['token']

# Obtenemos el valor del Token 
puts valueToken
```


* Timbrar CFDI V1

```
# Definimos las librerias a utilizar
require './SWSDKRuby'
require 'json'

# Crearemos nuestra función para leer archivos binarios (XML)
def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

# Definimos nuestros parametros a utilizar
URL = 'http://services.test.sw.com.mx'
Token = 'T2lYQ0t4L0RHVkR4dHZ5Nkk1VHNEakZ3Y0J4Nk9GODZuRyt4cE1wVm5tbXB3YVZxTHdOdHAwVXY2NTdJb1hkREtXTzE3dk9pMmdMdkFDR2xFWFVPUXpTUm9mTG1ySXdZbFNja3FRa0RlYURqbzdzdlI2UUx1WGJiKzViUWY2dnZGbFloUDJ6RjhFTGF4M1BySnJ4cHF0YjUvbmRyWWpjTkVLN3ppd3RxL0dJPQ.T2lYQ0t4L0RHVkR4dHZ5Nkk1VHNEakZ3Y0J4Nk9GODZuRyt4cE1wVm5tbFlVcU92YUJTZWlHU3pER1kySnlXRTF4alNUS0ZWcUlVS0NhelhqaXdnWTRncklVSWVvZlFZMWNyUjVxYUFxMWFxcStUL1IzdGpHRTJqdS9Zakw2UGRiMTFPRlV3a2kyOWI5WUZHWk85ODJtU0M2UlJEUkFTVXhYTDNKZVdhOXIySE1tUVlFdm1jN3kvRStBQlpLRi9NeWJrd0R3clhpYWJrVUMwV0Mwd3FhUXdpUFF5NW5PN3J5cklMb0FETHlxVFRtRW16UW5ZVjAwUjdCa2g0Yk1iTExCeXJkVDRhMGMxOUZ1YWlIUWRRVC8yalFTNUczZXdvWlF0cSt2UW0waFZKY2gyaW5jeElydXN3clNPUDNvU1J2dm9weHBTSlZYNU9aaGsvalpQMUxnRGQ3ZmtFTGNDYkdmbFJxUUdwK0RYdityM1BXamhmcFowNGtZaHFSZ3l6OCtqajFVZUo1Kzh3U3h3L1pJYW5zSC9YV3V1Rm5Jb252Ylo5QnJSRHBuT2ZLYXRMQUh4KzlIblh1NE5aMXRPejFOekhlT29qTzNZN1dDcGFsTzllems4MGNJK3FqY2libXNtcTQxeVhiY009.DnD-XtN7xgjQ608z33g6M7mFMgSQENoaL50YKH9VYtA'
XML = read_file("/resources/basico33.xml")
Version = 'v1'
Base64 = False


# Obtenemos el valor de nuestra petición
puts "Timbrado #{SWstamp::stamp(URL, Token, Version, XML, b64)}"


```

* Cancelación por CSD

```
# Definimos librerias a utilizar
require './SWSDKRuby'
require 'base64'
require 'json'




```




