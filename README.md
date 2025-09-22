# sw-sdk-ruby
SW Smarterweb libreria para consumir los servicios de cfdi

[![SW sapien](https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/68712/SW_smarter-Servicios_web.png)](http://sw.com.mx/)

Librería *Ruby* para el consumo de los servicios de SW sapien®.

## Contenido 

- [Compatibilidad](#Compatibilidad)
- [Dependencias](#Dependencias)
- [Documentación](#Documentación)
- [Instalación](#Instalación)
- [Implementación](#Implementación)
---

### Compatibilidad :clipboard:
- CFDI 4.0
- [Ruby 2.1 o superior](https://www.ruby-lang.org/en/downloads/releases/)

### Dependencias :toolbox:
- [rubygems](https://guides.rubygems.org/)
- [uri](https://rubygems.org/gems/uri-handler/versions/1.0.2)
- [net/http](https://rubygems.org/gems/net-http-persistent/versions/3.0.0)
- [json](https://ruby-doc.org/core-3.1.2/JSON.html)


### Documentación :open_file_folder:
* [Inicio Rápido](https://developers.sw.com.mx/knowledge-base/conoce-el-proceso-de-integracion-en-solo-7-pasos/)
* [Documentación Oficial Servicios](http://developers.sw.com.mx)
* [Documentación Ruby](https://www.ruby-lang.org/en/documentation/)


### Instalación :hammer_and_wrench:

Ejecutar los comandos directamente en consola

**[Gestor de paquetes de Windows](https://github.com/microsoft/winget-cli)**
```shell
winget install RubyInstallerTeam.Ruby
```
**Snap (Ubuntu u otras distribuciones Linux)**
 ```shell
$ sudo snap install ruby --classic
```

**[Instalación con RubyGems](https://rubygems.org/)**


 ```shell
 gem install ruby
```

### Implementación

Para efectos prácticos, usaremos el siguiente array asociativo como conjunto de parámetros utilizados por los servicios. 

> params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}

## Authentication ##

La clase de authentication, nos sirve para obtener un token de 2 hrs de duración. Podrá ser utilizado en los siguientes servicios para consumo.

<details>
<summary>
Authentication
</summary>

**Parámetros necesarios** 
* url 
* user 
* password

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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_token       |                   |
|  get_time_expire |                   |
|  get_status_code |                   |

</details>

## Cancelación ##
La clase de Cancelation nos servirá para cancelar algún comprobante anteriormente ya timbrado, teniendo diversas opciones para poder cancelar dicho documento.

<details>

<summary>
Cancelation
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token

Además de los parámetros que nos sean necesarios dependiendo del tipo de cancelación a usar.

**Funciones disponibles**

 - cancel_csd(uuid, rfc, password_csd, b64_cer, b64_key, motivo, foliosustitucion)
 - cancel_uuid(uuid, rfc, motivo, foliosustitucion)
 - cancel_pfx(uuid, rfc, password_csd, b64_pfx, motivo, foliosustitucion)
 - cancel_xml(xml_cancel, motivo, foliosustitucion)

| Parámetro         | Descripción       | 
|-------------------|-------------------|
|  uuid             | UUID del comprobante       | 
|  rfc              | RFC del emisor |
|  b64_cer          | Certificado del emisor en Base64                   | 
|  b64_key          | Key del emisor en Base64                  | 
|  b64_pfx          |Archivo Pfx en Base64                   |
|  password_csd     | Contraseña del certificado                  | 
|  xml_cancel       | XML con los comprobantes a cancelar               |
|  motivo           | Clave para expresar el motivo de la cancelación                  |
|  foliosustitucion | UUID del comprobante que sustituye                  |

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Cancelation/cancelation.rb'
```

**Ejemplo de uso**

```rb
Cancelation::set(params)
response_csd = Cancelation::cancel_csd(uuid, rfc, password_csd, b64_cer, b64_key, motivo)
response_uuid = Cancelation::cancel_uuid(uuid, rfc, motivo, foliosustitucion)
response_pfx = Cancelation::cancel_pfx(uuid, rfc, password_csd, b64_pfx, motivo)
response_xml = Cancelation::cancel_xml(xml_cancel, motivo, foliosustitucion)
```

Las funciones utilizables para estos objetos de cancelación son los siguientes

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |
</details>

## Emisión Timbrado ##


La clase Issue nos ayudará a timbrar nuestros documentos XML por medio de emisión-timbrado. A diferencia de la clase Stamp, esta clase además de timbrar el documento le pondrá el sello.

:pushpin:  ***NOTA:*** Para realizar el sellado, los certificados del **rfc emisor** deberán estar almacenados en el administrador de timbres.

<details>

<summary>
Issue
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token
* xml

**Funciones disponibles**

- set(params)
- issue_v1(xml, b64)
- issue_v2(xml, b64)
- issue_v3(xml, b64)
- issue_v4(xml, b64)
 
> **b64** es un parámetro opcional y se debe indicar en *true* si el XML va encodeado en base64. De no indicarse por defecto se tomará el valor de *false*

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

Las funciones correspondientes al objeto Issue son las siguientes

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |

</details>

## Timbrado JSON ##

La clase Issue nos ayudará a timbrar nuestros documentos JSON por medio de emisión-timbrado. 
<details>

<summary>
IssueJson
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token
* JSON


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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |

</details>

## Timbrado ##

La clase Stamp se utiliza para el timbrado de documentos XML. El documento deberá venir ya con el sello.

<details>

<summary>
Stamp
</summary>


**Parámetros necesarios** 
* url
* user y password o url y token
* xml sellado

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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |

</details>

:pushpin: ***NOTA:*** Existen varias versiones de respuesta, las cuales son las siguientes:

| Version |                         Respuesta                             | 
|---------|---------------------------------------------------------------|
|  V1     | Devuelve el timbre fiscal digital                             | 
|  V2     | Devuelve el timbre fiscal digital y el CFDI timbrado          | 
|  V3     | Devuelve el CFDI timbrado                                     | 
|  V4     | Devuelve todos los datos del timbrado                         |

## Usuarios V2 ##
Métodos para realizar la consulta de informacion de usuarios, así como la creación, actualización y eliminacion  de los mismos

<details>

**Parámetros necesarios** 
* url
* url Api
* user y password o token

**Funciones disponibles**

- set(params)
- create_user(name, taxId, email, stamps, isUnlimited, password, notificationEmail, phone)
- delete_user(idUser)
- update_user(idUser, name, taxId, notificationEmial, phone, isUnlimited)
- getUser_all()
- getUser_by_IdUser(idUser)
- getUser_by_email(email)
- getUser_by_taxId(taxId)
- getUser_by_isActive(isActive)

| Dato              | Descripción                                  |
|-------------------|----------------------------------------------|
| name              | Nombre del usuario                           |
| taxId             | RFC del usuario                              |
| email             | correo del nuevo usuario                     |
| stamps            | Cantidad de timbres a asignar                |
| isUnlimited       | Especificar si tendra timbres ilimitados     |
| password          | Contraseña del usuario                       |
| notificationEmail | Correo a donde quiere recibir notificaciones |
| phone             | Número del telefono del usuario              |
| isActive          | Especifica si la cuenta esta activa o no     |

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'AccountUser/accountUser.rb'
```

Setear los parámetros
```rb
params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
AccountUser::set(params)
```
```rb
params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
AccountUser::set(params)
```
</details>

<details>
  <summary>Crear usuario</summary>

<br>Este método permite crear una subcuenta.

**Ejemplo de consumo de la libreria para crear usuario**
```rb
name = "Prueba UT Hijo Ruby"
taxId = "XAXX010101000"
email = "userRuby_1@test.com"
password = "Contrasena_12345678"
notificationEmail = "userRuby_1@test.com"
phone = "0000000000"
response = AccountUser::create_user(name,taxId,email,1,false,password,notificationEmail,phone)
if (response.get_status == "success")
    data = response.get_data
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```

:pushpin: ***NOTA:*** La contraseña debe cumplir con las siguientes politicas:
* La contraseña no debe ser igual que el nombre de usuario.
* La contraseña debe incluir al menos una letra mayúscula.
* La contraseña debe incluir al menos una letra minúscula
* La contraseña debe incluir al menos un número.
* La contraseña debe incluir al menos un símbolo (carácter especial).
* La contraseña no debe incluir espacios en blanco.
* La contraseña debe tener entre 10 y 20 caracteres.
* La contraseña no debe incluir símbolos especiales fuera de lo común.
* Los caracteres especiales aceptados son los siguientes: !@#$%^&*()_+=\[{\]};:<>|./?,-]
</details>

<details>
  <summary>Actualizacion de datos de usuario</summary>

<br>Este método permite Actualizar la información de una subcuenta existente.

> [!NOTE]  
> Puedes asignarles "None" a las propiedades que no vayas a actualizar.

**Ejemplo de consumo de la libreria para actualizar subcuenta**
```rb
idUser = "b9e42c65-4afa-45a2-9b0d-d67b1373a7f4"
name = "Prueba UT Hijo Python Actualizado"
taxId = "XAXX010101002"
phone = "0000000001"
response = AccountUser::update_user(idUser,name,taxId,nil,phone,false)
if (response.get_status == "success")
    puts response.get_data
    #Solo regresara el Id del usuario actualizado
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Eliminación de usuario</summary>

<br>Este método permite eliminar una subcuenta

**Ejemplo de consumo de la libreria para eliminar subcuenta**
```rb
idUser = '2990D2BB-B26A-4FD5-B1CC-07AE84AE8085'
response = AccountUser::delete_user(idUser)
if (response.get_status == "success")
    puts response.get_data
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Obtener todos los usuarios</summary>

<br>Este método permite obtener todos los usuarios que existen

**Ejemplo de consumo de la libreria para obtener las subcuentas**
```rb
response = AccountUser::getUser_all
if (response.get_status == "success")
    data = response.get_data
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Obtener usuario por ID</summary>

<br>Este método permite obtener un usuario por Id

**Ejemplo de consumo de la libreria para obtener usuario por ID**
```rb
idUser = "32501CF2-DC62-4370-B47D-25024C44E131"
response = AccountUser::getUser_by_IdUser(idUser)
if (response.get_status == "success")
    data = response.get_data
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Obtener usuario por Email</summary>

<br>Este método permite obtener un usuario por Email

**Ejemplo de consumo de la libreria para obtener usuario por Email**
```rb
email = "usuario_prueba@example.com"
response = AccountUser::getUser_by_email(email)
if (response.get_status == "success")
    data = response.get_data
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Obtener usuario por RFC</summary>

<br>Este método permite obtener un usuario por RFC

**Ejemplo de consumo de la libreria para obtener usuario por RFC**
```rb
taxId = "AAAA000101010"
response = AccountUser::getUser_by_taxId(taxId)
if (response.get_status == "success")
    data = response.get_data
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>>Obtener usuarios que esten activos o desactivadosC</summary>

<br>Este método permite obtener usuarios que esten activos o desactivados

**Ejemplo de consumo de la libreria para obtener usuarios que esten activos o desactivados**
```rb
#"true" aplica para buscar solo cuentas activas y "false" para cuentas desactivadas
response = AccountUser::getUser_by_isActive(true)
if (response.get_status == "success")
    data = response.get_data
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

## Balance (Administración de saldo) ##
Métodos para realizar la consulta de saldo así como la asignación y eliminación de timbres a un usuario.

<details>

**Parámetros necesarios** 
* url
* url Api
* user y password o token

**Funciones disponibles**

- set(params)
- get_balance
- add_stamps(id,timbres,comment)
- remove_stamps(id,timbres,comment)

| Parámetro         | Descripción       | 
|-------------------|-------------------|
|  id               | Id de la subcuenta     | 
|  timbres          | Timbres a asignar o remover |
|  comment          | (Opcional) Comentario con el motivo de asignación o remoción de timbres  | 

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Balance/balance.rb'
```

Setear los parámetros
```rb
params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
Balance::set(params)
```
```rb
params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
Balance::set(params)
```
</details>

<details>
  <summary>Consulta de timbres</summary>

<br>Este método permite consultar el saldo de una cuenta.

**Ejemplo de consumo de la libreria para consultar timbres**
```rb
response = Balance::get_balance
if (response.get_status == "success")
    puts response.get_data.idUser
    puts response.get_data.idUserBalance
    puts response.get_data.stampsAssigned
    puts response.get_data.stampsUsed
    puts response.get_data.stampsBalance
else
    puts response.get_message
    puts response.get_messageDetail
end
```

**Ejemplo de consumo de la libreria para consultar timbres imprimiento todos los datos**
```rb
response = Balance::get_balance
if (response.get_status == "success")
    data = result_balance.get_data
    data.instance_variables.each do |var|
        value = data.instance_variable_get(var)
        puts "#{var}: #{value}"
    end
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Agregar timbres</summary>

<br>Este método permite agregar n cantidad de timbres a una subcuenta.

> [!NOTE] 
> El servicio regresa unicamente la cantidad de timbres despues del abono de timbres.

**Ejemplo de consumo de la libreria para agregar timbres**
```rb
id = "A1DFC01F-459A-4A05-BF68-1F04D1EF8860"
timbres = 2
comment = "Prueba Ruby"
response = Balance::add_stamps(id,timbres,comment)
if (response.get_status == "success")
    puts response.get_data
else
    puts response.get_message
    puts response.get_messageDetail
end
```
</details>

<details>
  <summary>Eliminar timbres</summary>

<br>Este método permite remover n cantidad de timbres a una subcuenta.

> [!NOTE]
> El servicio regresa unicamente la cantidad de timbres despues de remover los timbres.

**Ejemplo de consumo de la libreria para remover timbres**
```rb
id = "A1DFC01F-459A-4A05-BF68-1F04D1EF8860"
timbres = 2
comment = "Prueba Ruby"
response = Balance::remove_stamps(id,timbres,comment)
if (response.get_status == "success")
    puts response.get_data
else
    puts response.get_message
    puts response.get_messageDetail
end
```

</details>

## Validación ##

La clase Validation servirá para validar si nuestro XML no tiene algún error.

<details>

<summary>
Validation
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token

**Funciones disponibles**

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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |
</details>

## Pendientes de Aceptación/Rechazo ##


La clase Pendings servirá para obtener una lista de UUID's que tenga pendientes el RFC.
<details>

<summary>
Pendings
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token

Además de el RFC del cual consultaremos los UUID's pendientes.

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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |

</details>

## Aceptar o Rechazar cancelación ##


La clase AcceptReject servirá para aceptar o rechazar alguna factura que tenga pendiente el RFC asociado.

<details>

<summary>
AcceptReject
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token

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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |


</details>

## Relacionados ##

La clase Relations servirá para consultar las facturas que se encuentren relacionadas a un UUID.

<details>

<summary>
Relations
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token

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

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |

</details>

## Estatus Cfdi ##



La clase Status Cfdi servirá para consultar el estatus de cancelación, si es cancelable, vigente o cancelada de nuestras facturas.

<details>

<summary>
StatusCfdi
</summary>

**Parámetros necesarios** 
* url
* user y password o url y token.

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

</details>

## Storage #


La clase de Storage permite recuperar un XML enviando como parámetro el folio fiscal del comprobante.
<details>

<summary>
Storage
</summary>

**Parámetros necesarios** 
* url api
* url
* user y password o url api y token

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

</details>

## PDF ##

<details>
<summary>
Generar PDF
</summary>

Este método genera y obtiene un pdf en base64 a partir de un documento XML timbrado y una plantilla. Puede ser consumido ingresando tu usuario y contraseña así como tambien ingresando solo el token. 

**Parámetros necesarios** 
* url api
* url
* user y password o url api y token

**Funciones disponibles**

- set(params)
- generate_pdf(xml,templateId,logob64,extras)

El logo y el arreglo de extras son atributos opcionales que pueden omitirse.

Importar la clase al comienzo de nuestro programa de la siguiente manera

```rb
require 'Pdf/pdf.rb'
```

Setear los parámetros para autentificación con usuario y contraseña.
```rb
params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => 'user', "password" => 'password'}
Pdf::set(params)
```
Setear los parámetros para autentificación mediante token
```rb
params = {"url_api" => 'http://api.test.sw.com.mx', "token" => 'token'}
Pdf:set(params)
```

**Ejemplo de uso**

```rb
Pdf::set(params)
response = Pdf::generate_pdf(xml,'cfdi40')
puts response.get_contentB64 
```

**Ejemplo de uso con todos los atributos**

```rb
Pdf::set(params)
templateId = 'cfdi40'
logo = "/9j/4AAQSkZJRgABAQEASAB....."
extras = {'REFERENCIA': "Referencia de pruebas"}
response = Pdf::generate_pdf(xml, templateId, logo, extras)
puts response.get_contentB64 
```
Las funciones correspondientes al objeto que regresan estas funciones son las siguientes

| En caso de éxito | En caso de error  | 
|------------------|-------------------|
|  get_status      | get_message       | 
|  get_data        | get_messageDetail | 
|  get_response    |                   | 
|  get_status_code |                   |
|  get_contentB64  |                   |
|  get_contentSizeBytes |                   |
|  get_uuid        |                   |
|  get_serie       |                   |
|  get_folio       |                   |
|  get_stampDate   |                   |
|  get_issuedDate  |                   |
|  get_rfcIssuer   |                   |
|  get_rfcReceptor |                   |
|  get_total       |                   |


:pushpin: ***NOTA:*** Existen varias plantillas de PDF para el CFDI segun el tipo de comprobante, las cuales son las siguientes:

|    Version 4.0     |  Plantilla para el complemento  |   Template Id   |
|--------------------|---------------------------------|-----------------|
| :white_check_mark: | Factura ingreso, egreso         | cfdi40          |
| :white_check_mark: | Nómina                          | payroll40       |
| :white_check_mark: | Pagos                           | payment20       |
| :white_check_mark: | Carta porte                     | billoflading40  |

Para mayor referencia de estas plantillas de PDF, favor de visitar el siguiente [link](https://developers.sw.com.mx/knowledge-base/plantillas-pdf/).
</details>