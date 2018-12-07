class StatusCfdiResponse
    @status_code = nil
    @response = nil
    @codigo_estatus = nil
    @es_cancelable = nil
    @estado = nil
    @estatus_cancelacion = nil
	def initialize(response)
		set(response)
	end

	def set(response)
		begin
			@status_code = response.code
			@response = response.read_body
			@codigo_estatus = search_codigoEstatus(@response)
            @es_cancelable = search_EsCancelable(@response)
            @estado = search_Estado(@response)
            @estatus_cancelacion = search_EsatusCancelacion(@response)
        rescue
		end
    end
    private
    def search_codigoEstatus(response)
        string = response.split("<a:CodigoEstatus>", 2)
        string2 = string[1].split("</a:CodigoEstatus>", 2)
        return string2[0]
    end
    private
    def search_EsCancelable(response)
        string = response.split("<a:EsCancelable>", 2)
        string2 = string[1].split("</a:EsCancelable>", 2)
        return string2[0]
    end
    private
    def search_Estado(response)
        string = response.split("<a:Estado>", 2)
        string2 = string[1].split("</a:Estado>", 2)
        return string2[0]
    end
    private
    def search_EsatusCancelacion(response)
        string = response.split("<a:EstatusCancelacion>", 2)
        string2 = string[1].split("</a:EstatusCancelacion>", 2)
        return string2[0]
    end
    public
    def get_status_code
        return @status_code
    end
    def get_response
        return @response
    end
    def get_codigoEstatus
        return @codigo_estatus
    end
    def get_esCancelable
        return @es_cancelable
    end
    def get_estado
        return @estado
    end
    def get_estatusCancelacion
        return @estatus_cancelacion
    end
end