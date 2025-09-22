require_relative '../Response.rb'
require 'net/http'
require 'json'

class AccountUserResponse < Response
  @response = nil
  @data = nil

  def initialize(response)
		set(response)
	end

  def set(response)
    begin
      @status_code = response.code.to_i
      if response.body && !response.body.strip.empty?
        @response = JSON.parse(response.body)

        if @status_code == 200
          case @response['data']
          when Hash
            @data = DataItem.new(@response['data'])
          when Array
            @data = DataList.new(@response['data'])
          when String
            @data = @response['data']
          end
          @status = @response['status']
        else
          @status = @response['status'] || 'error'
          @message = @response['message']
          @messageDetail = @response['messageDetail']
        end

      elsif @status_code == 204
        @status = 'success'
        @status_code = 200
        @data = 'Usuario Eliminado con exito'
      else
        @status = 'error'
        @message = response.message
        @messageDetail = response.body
      end
    rescue => exception
      @status = 'error'
      @message = exception.backtrace
    end
  end

  # Getters para exponer data si se requiere
  def get_data
    return @data
  end
end

class DataItem
  attr_accessor :idUser, :idDealer, :name, :taxId, :username, :lastPasswordChange,
                :email, :notificationEmail, :profile, :isActive, :registeredDate,
                :accessToken, :stamps, :phone, :isUnlimited

  def initialize(data)
    @idUser = data['idUser'] || ''
    @idDealer = data['idDealer'] || ''
    @name = data['name'] || ''
    @taxId = data['taxId'] || ''
    @username = data['username'] || ''
    @lastPasswordChange = data['lastPasswordChange'] || ''
    @email = data['email'] || ''
    @notificationEmail = data['notificationEmail'] || ''
    @profile = data['profile'] || 0
    @isActive = data['isActive'] || false
    @registeredDate = data['registeredDate'] || ''
    @accessToken = data['accessToken'] || ''
    @stamps = data['stamps'] || 0
    @phone = data['phone'] || ''
    @isUnlimited = data['isUnlimited'] || false
  end
end

class DataList
  attr_accessor :items

  def initialize(data)
    @items = data.map { |item| DataItem.new(item) }
  end
end
