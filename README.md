[![Ruby](http://sw.com.mx/images/logo.png)](http://sw.com.mx/)
# Requerimientos #

**Ruby 2.1** o superior.

[Net/Http](https://rubygems.org/gems/net-http-persistent/versions/3.0.0)

[URI](https://rubygems.org/gems/uri-handler/versions/1.0.2)

**Instalación con RubyGems**

Ejecutar los comandos directamente en la consola tal cual aparecen en la página de rubygems, en este caso:

> gem install net-http-persistent
> gem install uri-handler

# Consumo #

Para efectos prácticos, usaremos el siguiente array asociativo como conjunto de parámetros utilizados por los servicios. 

> params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}

## Authentication ##

Parámetros necesarios: url, user y password.

La clase de authentication, nos sirve para obtener un token de 2 hrs de duración. Podrá ser utilizado en los siguientes servicios para consumo.

Funciones disponibles

- set(Params)
- authentication()

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'Authentication/Auth.rb'
```

Ejemplo de uso

```rb
Auth::set(params)
token = Auth::authentication().getToken()
```

Las funciones utilizables para el objeto obtenido son las siguientes

 > *getTimeExpire()*
 > *getToken()*
 > *getMessage()*
> *getMessageDetail()*
> *getData()*

## Balance ##

Parámetros necesarios: [url, user y password] o [url y token].

La clase de Balance nos ayuda a obtener información referente a nuestra cuenta. Así sabremos cuando nos quedan pocos timbres o cuantos tenemos asignados, etc. 

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'Balance/Balance.rb'
```

Ejemplo de uso

```rb
Balance::set(params)
responseBalance = Balance::getAccountBalance()
timbres = responseBalance.getSaldoTimbres()
```

Las funciones utilizables para el objeto obtenido son las siguientes

> *getIdSaldoCliente()*
> *getIdClienteUsuario()*
> *getSaldoTimbres()*
> *getTimbresUtilizados()*
> *getFechaExpiracion()*
> *getTimbresAsignados()*
> *getMessage()*
> *getMessageDetail()*
> *getData()*

## Cancelación ##

Parámetros necesarios: [url, user y password] o [url y token]. Además de los parámetros que nos sean necesarios dependiendo del tipo de cancelación a usar.

La clase de Cancelation nos servirá para cancelar algún comprobante anteriormente ya timbrado, teniendo diversas opciones para poder cancelar dicho documento.

Funciones disponibles

 - cancelCsd(uuid, rfc, passwordCSD, b64CSD, b64Key)
 - cancelUuid(uuid, rfc)
 - cancelPfx(uuid, rfc, Password, B64PFX)
 - cancelXml(xml)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'Cancelation/Cancelation.rb'
```

Ejemplo de uso

```rb
Cancelation::set(params)
responseCancelacionCSD = Cancelation::cancelCsd(uuid, rfc, passwordcsd, b64CSD, b64Key)
responseCancelacionUUID = Cancelation::cancelUuid(uuid, rfc)
responseCancelacionPFX = Cancelation::cancelPfx(uuid, rfc, passwordcsd, b64PFX)
responseCancelacionXML = Cancelation::cancelXml(xmlCancel)
```

Las funciones utilizables para estos objetos de cancelación son los siguientes

> *getMessage()*
> *getMessageDetail()*
> *getData()*

## Issue ##

Parámetros necesarios: [user, password y url] o [token y url], así como el XML a timbrar utilizando emisión-timbrado.

La clase Issue nos ayudará a timbrar nuestros documentos XML por medio de emisión-timbrado. A diferencia de la clase Stamp, esta clase además de timbrar el documento le pondrá el sello.

Funciones disponibles

- set(params)
- issueV1(xml, b64)
- issueV2(xml, b64)
- issueV3(xml, b64)
- issueV4(xml, b64)
- issueJsonV1(xml, b64)
- issueJsonV2(xml, b64)
- issueJsonV3(xml, b64)
- issueJsonV4(xml, b64)
-  > **b64** es un parámetro opcional y se debe indicar en *true* si el XML va encodeado en base 64. De no indicarse por defecto se tomará el valor de *false*

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'Issue/Issue.rb'
```

Ejemplo de uso

```rb
Issue::set(params)
responseIssue = Issue::issueV4(xml,false)
File.open(responseIssue.getUuid()+'.xml', 'w') { |file| file.write(responseIssue.getCfdi()) }
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

> *getMessage()*
> *getMessageDetail()*
> *getData()*
> *getUuid()*
> *getQrCode()*
> *getCfdi()*

## Stamp ##

Parámetros necesarios: [user, password y url] o [token y url], así como el XML a timbrar.

La clase Stamp se utiliza para el timbrado de documentos XML. El documento deberá venir ya con el sello.

Funciones disponibles

- set(params)
- stampV1(xml, b64)
- stampV2(xml, b64)
- stampV3(xml, b64)
- stampV4(xml, b64)
- stampJsonV1(xml, b64)
- stampJsonV2(xml, b64)
- stampJsonV3(xml, b64)
- stampJsonV4(xml, b64)
-  > **b64** es un parámetro opcional y se debe indicar en *true* si el XML va encodeado en base 64. De no indicarse por defecto se tomará el valor de *false*

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'Stamp/Stamp.rb'
```

Ejemplo de uso

```rb
Stamp::set(params)
responseStamp = Stamp::issueV4(xml)
File.open(responseIssue.getUuid()+'.xml', 'w') { |file| file.write(responseIssue.getCfdi()) }
```
Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

> *getUuid()*
> *getQrCode()*
> *getCfdi()*
> *getMessage()*
> *getMessageDetail()*
> *getData()*

## Validación ##

Parámetros necesarios: [user, password y url] o [token y url]. Además de parámetros adicionales según sea el caso.

La clase Validation servirá para validar que algunas cosas se encuentren de manera correcta antes de proceder al timbrado del mismo. Por ejemplo, nos pueden ayudar a decir si nuestro XML no tiene algún error, o consultar algún RFC de la lista de contribuyentes obligados.

Funciones disponibles

- set(params)
- validateXml(xml)
- validateLrfc(rfc)
- validateNoCert(noCert)

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require_relative 'Validate/Validate.rb'
```

Ejemplo de uso

```rb
Validate::set(params)
responseXML = Validate::validateXml(xml)
puts responseXML.getMessageDetail()
responseRFC = validateLrfc(rfc)
puts responseRFC.getData()
responseNoCert = validateNoCert(noCert)
puts responseNoCert.getData()
```

Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

> *getStatus()*
> *getMessage()*
> *getMessageDetail()*
> *getData()*
> *getStatusCode()*