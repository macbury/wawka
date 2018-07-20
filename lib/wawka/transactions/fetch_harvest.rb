module Wawka
  module Transactions
    class FetchHarvest < Operation
      def call(date:)
        page = 1
        entries = []
        loop do
          data = harvest.time_entries(from: date - 1.month, to: date, page: page)
          entries += data['time_entries']
          break if data['page'] == data['total_pages']
          page = data['page'] + 1
        end
        Success(entries)
      end

      private

      def harvest
        @harvest ||= Harvest.new
      end
    end
  end
end
