
class StatusCfdiResponse
    @statusCode = nil
    @response = nil
    @CodigoEstatus = nil
    @EsCancelable = nil
    @Estado = nil
    @EstatusCancelacion = nil
	def initialize(cResponse)
		set(cResponse)
	end

	def set(cResponse)
		begin
			@statusCode = cResponse.code
			@response = cResponse.read_body
			@CodigoEstatus = searchCodigoEstatus(@response)
            @EsCancelable = searchEsCancelable(@response)
            @Estado = searchEstado(@response)
            @EstatusCancelacion = searchEsatusCancelacion(@response)
        rescue
		end
    end
    private
    def searchCodigoEstatus(cResponse)
        string = cResponse.split("<a:CodigoEstatus>", 2)
        string2 = string[1].split("</a:CodigoEstatus>", 2)
        return string2[0]
    end
    private
    def searchEsCancelable(cResponse)
        string = cResponse.split("<a:EsCancelable>",2)
        string2 = string[1].split("</a:EsCancelable>", 2)
        return string2[0]
    end
    private
    def searchEstado(cResponse)
        string = cResponse.split("<a:Estado>", 2)
        string2 = string[1].split("</a:Estado>", 2)
        return string2[0]
    end
    private
    def searchEsatusCancelacion(cResponse)
        string = cResponse.split("<a:EstatusCancelacion>", 2)
        string2 = string[1].split("</a:EstatusCancelacion>", 2)
        return string2[0]
    end
    public
    def getStatusCode()
        return @statusCode
    end
    def getresponse()
        return @response
    end
    def getCodigoEstatus()
        return @CodigoEstatus
    end
    def getEsCancelable()
        return @EsCancelable
    end
    def getEstado()
        return @Estado
    end
    def getEstatusCancelacion()
        return @EstatusCancelacion
    end
end