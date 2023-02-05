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

Servicio para consultar las cancelaciones pendientes de aceptacion.

**Funciones disponibles

```rb
require 'Pendings/pendings.rb'

Pendings::set(params)
response = Pendings::get_pendings(rfc)
```

## Aceptacion/Rechazo Cancelacion

Servicio para aceptar o rechazar una solicitud de cancelacion.

* ### Aceptacion

```rb

```

* ### Rechazo

```rb

```

## Relacionados

```rb
require 'Relations/relations.rb'
```

## Estatus CFDI
