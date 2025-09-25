require_relative '../Response.rb'
require 'net/http'
require 'json'

class AccountBalanceResponse < Response
  def initialize(response)
    set(response)
  end

  def set(response)
    begin
      @status_code = response.code.to_i
      if response.body && !response.body.strip.empty?
        @response = JSON.parse(response.body)

        if @status_code == 200
          @data = @response['data']
          @status = @response['status']
        else
          @status = @response['status']
          @message = @response['message']
          @messageDetail = @response['messageDetail'] if @response.key?('messageDetail')
        end
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
end

class BalanceResponse < Response
  def initialize(response)
    set(response)
  end

  def set(response)
    begin
      @status_code = response.code
      if response.body && !response.body.strip.empty?
        @response = JSON.parse(response.body)

        if @status_code.to_i== 200
          @data = DataItem.new(@response['data'])
          @status = @response['status']
        else
          @status = @response['status']
          @message = @response['message']
          @messageDetail = @response['messageDetail'] if @response.key?('messageDetail')
        end
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
  attr_accessor :idUserBalance, :idUser, :stampsBalance, :stampsUsed, :stampsAssigned,
                :unlimited, :expirationDate, :lastTransaction

  def initialize(data)
    @idUserBalance   = data['idUserBalance'] || ''
    @idUser          = data['idUser'] || ''
    @stampsBalance   = data['stampsBalance'] || 0
    @stampsUsed      = data['stampsUsed'] || 0
    @stampsAssigned  = data['stampsAssigned'] || 0
    @unlimited       = data['unlimited'] || false
    @expirationDate  = data['expirationDate'] || ''
    @lastTransaction = data.key?('lastTransaction') ? LastTransaction.new(data['lastTransaction']) : nil
  end
end

class LastTransaction
  attr_accessor :folio, :idUSer, :idUserReceiver, :nameReceiver, :stampsIn,
                :stampsOut, :stampsCurrent, :comment, :date, :isEmailSent

  def initialize(transaction)
    @folio          = transaction['folio'] || 0
    @idUSer         = transaction['idUSer'] || ''
    @idUserReceiver = transaction['idUserReceiver'] || ''
    @nameReceiver   = transaction['nameReceiver'] || ''
    @stampsIn       = transaction['stampsIn'] || 0
    @stampsOut      = transaction['stampsOut'] || nil
    @stampsCurrent  = transaction['stampsCurrent'] || 0
    @comment        = transaction['comment'] || ''
    @date           = transaction['date'] || ''
    @isEmailSent    = transaction['isEmailSent'] || false
  end
end
