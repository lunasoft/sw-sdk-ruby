[![Ruby](https://sw.com.mx/wp-content/themes/sw/images/logo-swsapien.svg)](http://sw.com.mx/)

# SW-Sdk-Ruby

Librería donde están integradas las API's de los servicios SW, timbrado, cancelaciones, etc, además de servicio de sellado de CFDI 4.0.

## Contenido

***
### Compatibilidad

* **Ruby 2.7** o superior.

### Dependencias 

* [Net/Http](https://rubygems.org/gems/net-http-persistent/versions/3.0.0)

* [json](https://rubygems.org/gems/nokogiri)

* [securerandom](https://rubygems.org/gems/nokogiri)

* [time](https://rubygems.org/gems/nokogiri)

* [nokogiri](https://rubygems.org/gems/nokogiri)

### Instalación con RubyGems

Ejecutar los comandos directamente en la consola tal cual aparecen en la página de rubygems, en este caso:

> bundle install

## Consumo

Para inicializar la clase de un servicio se debera enviar un array que incluya la informacion de la url del entorno, el usuario y la contraseña.


> params = {"url" => 'http://services.test.sw.com.mx', "user" => 'user@test.com.mx', "password" => '123456789'}

## Autenticacion

Servicio de autenticacion, contiene un metodo para la obtencion de un token temporal con vigencia de hasta dos horas.

***

```rb
require_relative 'Authentication/auth.rb'

Auth::set(params)
response = Auth::authentication
```

## Timbrado

Servicio de timbrado en el cual se recibe un CFDI previamente sellado en formato XML.

```rb
require_relative 'Stamp/stamp.rb'

Stamp::set(params)
response = Stamp::stamp_v1(xml_signed)
```

## Emision Timbrado JSON

Servicio de timbrado en el cual se recibe un CFDI sin sellar en formato JSON. Este servicio sella y timbra el comprobante.

```rb
require 'Issue/issue.rb'

Issue::set(params)
result_issue = Issue::issue_JSON_v3(json_hash.to_json)
```

## Cancelación

Servicio de cancelacion de CFDI, existen 4 metodos los cuales reciben diferente parámetros.

* Cancelacion CSD

```rb
require 'Cancelation/cancelation.rb'

Cancelation::set(params)
response = Cancelation::cancel_csd(uuid, rfc, password_csd, b64_csd, b64_key, motivo)
```

* Cancelacion UUID

```rb
require 'Cancelation/cancelation.rb'

Cancelation::set(params)
response = Cancelation::cancel_uuid(uuid, rfc, motivo)
```

* Cancelacion PFX

```rb
require 'Cancelation/cancelation.rb'

Cancelation::set(params)
response = Cancelation::cancel_pfx(uuid, rfc, password_csd, b64_pfx, motivo)
```

* Cancelacion XML

```rb
require 'Cancelation/cancelation.rb'

Cancelation::set(params)
response = Cancelation::cancel_xml(xml)
```

## Validación

Servicio de validacion de CFDI en formato XML.

```rb
require 'Validation/validate.rb'

Validate::set(params)
response = Validate::validate_xml(xml)
```

## Cancelaciones Pendientes

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

## Status Cfdi

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
