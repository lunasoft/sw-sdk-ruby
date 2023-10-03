require_relative '../Storage/storage.rb'
require_relative './sign_helper.rb'

require 'rqrcode'

class ConvertionHelper
    def self.response_to_v4(tfd, cfdi)
        # Validar que los parametros no sean nulos o vacios
        if tfd == nil? || tfd.length <= 0 || cfdi == nil? || cfdi.length <= 0
            raise 'El TFD o el CFDI se encuentran vacíos.'
        end

        # Obtener TFD
        tfd_node = get_tfd_node(tfd)
        if tfd_node.nil? 
            raise 'El TFD se encuentra corrupto o es inválido.'
        end

        # Obtener CFDI
        cfdi_node = get_cfdi_node(cfdi)
        if cfdi_node.nil?
            raise 'El CFDI se encuentra corrupto o es inválido.'
        end
        
        # Obtener datos del TFD
        uuid = tfd_node['UUID']
        fecha_timbrado = tfd_node['FechaTimbrado']
        sello_cfd = tfd_node['SelloCFD']
        sello_sat = tfd_node['SelloSAT']
        certificado_sat = tfd_node['NoCertificadoSAT']
        
        # Generar y obtener cadena original del TFD
        cadena_tfd = get_tfd_cadena(tfd)
        
        # Obtener datos del CFDI
        total = cfdi_node['Total']
        certificado_cfd = cfdi_node['NoCertificado']
        rfc_emisor = cfdi_node.at_xpath(".//*[local-name()='Emisor']/@Rfc")
        rfc_receptor = cfdi_node.at_xpath(".//*[local-name()='Receptor']/@Rfc")

        # Generar y obtener codigo QR
        qr_code = create_qr(uuid, rfc_emisor, rfc_receptor, total, sello_cfd)
        
        # Setear y retornar data response
        response_data = {
            'cadenaOriginalSAT' => cadena_tfd,
            'noCertificadoSAT' => certificado_sat,
            'noCertificadoCFDI' => certificado_cfd,
            'uuid' => uuid,
            'selloSAT' => sello_sat,
            'selloCFDI' => sello_cfd,
            'fechaTimbrado' => fecha_timbrado,
            'qrCode' => qr_code,
            'cfdi' => cfdi
        }

        return response_data
    end
    private
    def self.get_tfd_node(xml)
        xml_doc = Nokogiri::XML(xml)
        tfd_node = xml_doc.at_xpath("//*[local-name()='TimbreFiscalDigital']")
        return tfd_node
    end
    def self.get_cfdi_node(xml)
        xml_doc = Nokogiri::XML(xml)
        cfdi_node = xml_doc.at_xpath("//*[local-name()='Comprobante']")
        return cfdi_node
    end
    private
    def self.get_tfd_cadena(tfd)
        cadena = SignHelper::get_cadena_original(tfd, true)
        return cadena.to_s.sub(/<\?xml.*?\?>/, '').strip
    end
    private
    def self.create_qr(uuid, rfc_emisor, rfc_receptor, total, sello)
        formatted_total = sprintf("%025.6f", total.to_s)
        formatted_sello = sello[-9..-1]
        url = "https://verificacfdi.facturaelectronica.sat.gob.mx/default.aspx?" + 
        "id=#{uuid}&re=#{rfc_emisor}&rr=#{rfc_receptor}&tt=#{formatted_total}&fe=#{formatted_sello}"

        qrcode = RQRCode::QRCode.new(url)
        png = qrcode.as_png(
            resize_gte_to: false,
            resize_exactly_to: false,
            fill: 'white',
            color: 'black',
            size: 140,
            border_modules: 4,
            module_px_size: 6
        )
        base64_qr = Base64.encode64(png.to_s)

        return base64_qr
    end
end