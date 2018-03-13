# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# Importamos la libreria de SW-Services y la libreria de JSON para el parseo
# require 'SW-Services'
require 'SWSDKRuby'
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