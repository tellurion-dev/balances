module Currencies
  class Litecoin < Base

    API = 'https://ltc.blockr.io/api/v1'
    CURRENCY_NAME = 'Litecoin'
    SHORT_NAME = 'LTC'
    SYMBOLS = ['L']

    def self.info(address)
      response = self.get_response("#{API}/address/info/#{address}")
      info = response[:data]
      info[:first_tx_at] = info[:first_tx] ? info[:first_tx][:time_utc] : nil
      info
    end

    def self.balance(address)
      response = self.get_response("#{API}/address/info/#{address}")
      response[:data][:balance]
    end

    def self.valid?(address)
      response = self.get_response("#{API}/address/info/#{address}")
      response[:data][:is_valid]
    end

    # Conversions
    def self.to_doge(value)
      value_btc = self.to_btc(value)
      Currencies::Bitcoin.to_doge value_btc
    end

  end
end
