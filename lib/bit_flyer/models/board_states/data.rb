module BitFlyer
  module Models
    module BoardStates
      class Data
        attr_reader :special_quotation

        def initialize(attrs = {})
          @special_quotation = attrs['special_quotation']
        end
      end
    end
  end
end