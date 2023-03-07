
[![Ruby](http://sw.com.mx/images/logo.png)](http://sw.com.mx/)
# Requerimientos #

**Ruby 2.1** o superior.

[Net/Http](https://rubygems.org/gems/net-http-persistent/versions/3.0.0)

[URI](https://rubygems.org/gems/uri-handler/versions/1.0.2)

**Instalación con RubyGems**

Ejecutar los comandos directamente en la consola tal cual aparecen en la página de rubygems, en este caso:

>- gem install net-http-persistent
>- gem install uri-handler

# Consumo #

Para efectos prácticos, usaremos el siguiente array asociativo como conjunto de parámetros utilizados por los servicios. 

> params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}

## Authentication ##

Parámetros necesarios: url, user y password.

La clase de authentication, nos sirve para obtener un token de 2 hrs de duración. Podrá ser utilizado en los siguientes servicios para consumo.

**Funciones disponibles**

- set(Params)
- authentication

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Authentication/auth.rb'
```

**Ejemplo de uso**

```rb
Auth::set(params)
token = Auth::authentication.get_token
```

Las funciones utilizables para el objeto obtenido son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_time_expire*
>- *get_token*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*
 
## Balance ##

Parámetros necesarios: [url, user y password] o [url y token].

La clase de Balance nos ayuda a obtener información referente a nuestra cuenta. Así sabremos cuando nos quedan pocos timbres o cuantos tenemos asignados, etc. 

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Balance/balance.rb'
```

**Ejemplo de uso**

```rb
Balance::set(params)
response = Balance::account_balance
timbres = response.get_data['saldoTimbres']
```

Las funciones utilizables para el objeto obtenido son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## Cancelación ##

Parámetros necesarios: [url, user y password] o [url y token]. Además de los parámetros que nos sean necesarios dependiendo del tipo de cancelación a usar.

La clase de Cancelation nos servirá para cancelar algún comprobante anteriormente ya timbrado, teniendo diversas opciones para poder cancelar dicho documento.

**Funciones disponibles**

 - cancel_csd(uuid, rfc, password_csd, b64_csd, b64_key)
 - cancel_uuid(uuid, rfc)
 - cancel_pfx(uuid, rfc, password_csd, b64_pfx)
 - cancel_xml(xml_cancel)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Cancelation/cancelation.rb'
```

**Ejemplo de uso**

```rb
Cancelation::set(params)
response_csd = Cancelation::cancel_csd(uuid, rfc, password_csd, b64_csd, b64_key)
response_uuid = Cancelation::cancel_uuid(uuid, rfc)
response_pfx = Cancelation::cancel_pfx(uuid, rfc, password_csd, b64_pfx)
response_xml = Cancelation::cancel_xml(xml_cancel)
```

Las funciones utilizables para estos objetos de cancelación son los siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## Issue ##

Parámetros necesarios: [user, password y url] o [token y url], así como el XML a timbrar utilizando emisión-timbrado.

La clase Issue nos ayudará a timbrar nuestros documentos XML por medio de emisión-timbrado. A diferencia de la clase Stamp, esta clase además de timbrar el documento le pondrá el sello.
Nota: Para realizar el sellado, los certificados del **rfc emisor** deberán estar almacenados en el administrador de timbres.

**Funciones disponibles**

- set(params)
- issue_v1(xml, b64)
- issue_v2(xml, b64)
- issue_v3(xml, b64)
- issue_v4(xml, b64)
-  > **b64** es un parámetro opcional y se debe indicar en *true* si el XML va encodeado en base64. De no indicarse por defecto se tomará el valor de *false*

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Issue/issue.rb'
```

**Ejemplo de uso**

```rb
Issue::set(params)
response = Issue::issue_v4(xml,false)
File.open(response.get_data['uuid']+'.xml', 'w') { |file| file.write(response.get_data['cfdi']) }
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## IssueJson ##

Parámetros necesarios: [user, password y url] o [token y url], así como el JSON a timbrar utilizando emisión-timbrado.

La clase Issue nos ayudará a timbrar nuestros documentos JSON por medio de emisión-timbrado. 

**Funciones disponibles**

- set(params)
- issue_JSON_v1(json)
- issue_JSON_v2(json)
- issue_JSON_v3(json)
- issue_JSON_v4(json)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Issue/issue.rb'
```

**Ejemplo de uso**

```rb
Issue::set(params)
response = Issue::issue_JSON_v4(json)
File.open(response.get_data['uuid']+'.xml', 'w') { |file| file.write(response.get_data['cfdi']) }
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## Stamp ##

Parámetros necesarios: [user, password y url] o [token y url], así como el XML a timbrar.

La clase Stamp se utiliza para el timbrado de documentos XML. El documento deberá venir ya con el sello.

**Funciones disponibles**

- set(params)
- stamp_v1(xml, b64)
- stamp_v2(xml, b64)
- stamp_v3(xml, b64)
- stamp_v4(xml, b64)
> **b64** es un parámetro opcional y se debe indicar en *true* si el XML va encodeado en base 64. De no indicarse por defecto se tomará el valor de *false*

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Stamp/stamp.rb'
```

Ejemplo de uso

```rb
Stamp::set(params)
response = Stamp::stamp_v4(xml)
File.open(response.get_data['uuid']+'.xml', 'w') { |file| file.write(response.get_data['cfdi']) }
```
Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*
## Validación ##

Parámetros necesarios: [user, password y url] o [token y url]. Además de parámetros adicionales según sea el caso.

La clase Validation servirá para validar si nuestro XML no tiene algún error.

Funciones disponibles

- set(params)
- validate_xml(xml)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Validation/validate.rb'
```

Ejemplo de uso

```rb
Validate::set(params)
response_xml = Validate::validateXml(xml)
puts response_xml.get_response
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## Pendings ##

Parámetros necesarios: [user, password y url] o [token y url]. Además de el RFC del cual consultaremos los UUID's pendientes.

La clase Pendings servirá para obtener una lista de UUID's que tenga pendientes el RFC.

**Funciones disponibles**

- set(params)
- get_pendings(rfc)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Pendings/pendings.rb'
```

**Ejemplo de uso**

```rb
rfc = 'LAN7008173R5'
Pendings::set(params)
reponse = Pendings::get_pendings(rfc)
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## AcceptReject ##

Parámetros necesarios: [user, password y url] o [token y url]. Además de parámetros adicionales según sea el caso.

La clase AcceptReject servirá para aceptar o rechazar alguna factura que tenga pendiente el RFC asociado.

**Funciones disponibles**

- set(params)
- accept_reject_csd(uuids, rfc, password, csd, key)
- accept_reject_pfx(uuids, rfc, password, pfx)
- accept_reject_uuid(uuid, rfc, action)
- accept_reject_xml(xml)
> Action puede ser "aceptacion" o "rechazo"

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'AcceptReject/accept_reject.rb'
```

**Ejemplo de uso**

```rb
b64_csd = read_file('../../resources/b64CSD.txt')
b64_key = read_file('../../resources/b64Key.txt')
password_csd = '12345678a'
uuids = []
uuids << {"uuid" => "6b02b155-25fd-488d-862b-5a5dc5694b62", "action" => "Rechazo"}
uuids << {"uuid" => "ef47cd9e-b495-483d-b7ad-7f374fe8e353", "action" => "Rechazo"}
rfc = 'LAN7008173R5'
AcceptReject::set(params)
response = AcceptReject::accept_reject_csd(uuids, rfc, password_csd, b64_csd, b64_key)
puts response.get_response
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## Relations ##

Parámetros necesarios: [user, password y url] o [token y url]. Además de parámetros adicionales según sea el caso.

La clase Relations servirá para consultar las facturas que se encuentren relacionadas a un UUID.

**Funciones disponibles**

- set(params)
- relations_csd(uuid, rfc, passwordcsd, b64CSD, b64Key)
- relations_pfx(uuid, rfc, passwordcsd, b64PFX)
- relations_uuid(uuid, rfc)
- relations_xml(xml)
Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Relations/relations.rb'
```

**Ejemplo de uso**

```rb
b64_csd = read_file('../../resources/b64CSD.txt')
b64_key = read_file('../../resources/b64Key.txt')
password_csd = '12345678a'
uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
rfc = 'LAN7008173R5'
Relations::set(params)
response =  Relations::relations_csd(uuid, rfc, password_csd, b64_csd, b64_key)
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

**En caso de éxito**
>- *get_status*
>- *get_data*
>- *get_response*
>- *get_status_code*

**En caso de error**
>- *get_message*
>- *get_messageDetail*

## Status Cfdi ##

Parámetros necesarios: [url de consulta, action], así como parámetros correspondientes a la factura como son: rfcEmisor, rfcReceptor, total, y uuid.

La clase Status Cfdi servirá para consultar el estatus de cancelación, si es cancelable, vigente o cancelada de nuestras facturas.

**Funciones disponibles**

- status(rfc_emisor, rfc_receptor, total, uuid, url, action)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'StatusCfdi/status_cfdi.rb'
```

**Ejemplo de uso**

```rb
url = 'https://consultaqr.facturaelectronica.sat.gob.mx/ConsultaCFDIService.svc'
action = 'http://tempuri.org/IConsultaCFDIService/Consulta'
rfc_emisor = 'LAN7008173R5'
rfc_receptor = 'LAN8507268IA'
total = '5800.00'
uuid = 'a9143107-25c5-4fb9-b0eb-2fcbcb855967'
response = StatusCfdi::status(rfc_emisor, rfc_receptor, total, uuid, url, action)
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

>- *get_status_code*
>- *get_response*
>- *get_codigoEstatus*
>- *get_esCancelable*
>- *get_estado*
>- *get_estatusCancelacion*

## Storage #

Parámetros necesarios: [url_api, url, user y password] o [url_api y token].

La clase de Storage permite recuperar un XML enviando como parámetro el folio fiscal del comprobante.

**Funciones disponibles**

- get_xml(uuid)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Storage/storage.rb'
```

Setear los parámetros.

```rb
params = {"url_api" => 'http://api.test.sw.com.mx', "token" => ENV["SDKTEST_TOKEN"]}
Storage::set(params)
```

```rb
params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
Storage::set(params)
```

**Ejemplo de uso**

```rb
uuid = "b35d525e-d845-42c9-bbfb-eeeef601e2b4"
response = Storage::get_xml(uuid)
```
