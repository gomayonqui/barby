require 'barby/barcode/gs1_128'

module Barby

  class GS1CO < GS1128

    def initialize(ai, type, data)
      self.application_identifier = ai
      if type && data.any?
        self.type = type
        self.data = data
      else
        raise ArgumentError, 'Data not valid' unless valid?
      end
    end

    def data
      FNC1 + application_identifier +  @data.join(FNC1).to_s
    end

  end
end
