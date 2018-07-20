module Wawka
  module Transactions
    class Base
      include Dry::Transaction(container: Wawka::Container)

      def self.call(params, &block)
        new.call(params, &block)
      end
    end
  end
end
