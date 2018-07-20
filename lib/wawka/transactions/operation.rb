module Wawka
  module Transactions
    class Operation
      include Dry::Transaction::Operation

      def self.call(params, &block)
        new.call(params, &block)
      end
    end
  end
end
