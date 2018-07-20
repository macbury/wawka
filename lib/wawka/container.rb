module Wawka
  class Container
    extend Dry::Container::Mixin

    namespace 'harvest' do
      register 'fetch' do 
        Transactions::FetchHarvest.new
      end
    end

    namespace 'excel' do
      register 'generate' do
        Transactions::GenerateExcel.new
      end
    end
  end
end
