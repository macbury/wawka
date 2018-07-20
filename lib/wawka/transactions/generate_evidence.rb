module Wawka
  module Transactions
    class GenerateEvidence < Base
      step :prepare_date
      step :fetch_entries, with: 'harvest.fetch'
      step :accumulate_services
      step :be_more_enterprise
      step :generate_excel, with: 'excel.generate'

      attr_reader :date

      def initialize(input_date)
        super({})
        @date = input_date.is_a?(Date) ? input_date : Date.parse(input_date)
      end

      def prepare_date(_)
        Success(date: date)
      end

      def accumulate_services(entries)
        Success(entries.inject({}) do |output, entry|
          task = entry.dig('task', 'name')
          output[task] ||= 0
          output[task] += entry['hours']
          output
        end)
      end

      def be_more_enterprise(services)
        enterprise_services = services.inject([]) do |output, (name, hours)|
          enterprise_name = Wawka.config.dig('enterprise', name).sample
          output << { name: enterprise_name, hours: hours }
          output
        end
        Success(services: enterprise_services)
      end

      def generate_excel(services:)
        super(
          agreement_date: Wawka.config['agreement_date'],
          name: Wawka.config['company_name'],
          services: services, 
          date: date
        )
      end
    end
  end
end
