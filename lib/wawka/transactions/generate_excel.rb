module Wawka
  module Transactions
    class GenerateExcel < Operation
      MONTH_NAMES = %w(Styczeń Luty Marzec Kwiecień Maj Czerwiec Lipiec Sierpień Wrzesień Październik Listopad Grudzień)

      def call(agreement_date:, name:, date: Date.today, services:)
        update_row(0, 0, "<<DATE>>", agreement_date.strftime("%Y-%m-%d"))
        update_row(4, 3, "<<NAME>>", name)
        update_row(5, 3, "<<MONTH>>", MONTH_NAMES[date.mon-1])
        update_row(6, 3, "<<YEAR>>", date.year)
        
        start = 9
        finish = 19

        (finish-start).times do |index|
          row = index + start
          service = services[index]
          if service
            update_row(row, 0, "<<LP>>", index+1)
            update_row(row, 1, "<<SERVICE>>", service[:name])
            update_row(row, 4, "<<HOURS>>", service[:hours])
          else
            update_row(row, 0, "<<LP>>", "")
            update_row(row, 1, "<<SERVICE>>", "")
            update_row(row, 4, "<<HOURS>>", "")
            worksheet.row(row).height = 0 # deleting rows is broken as shit so set their height to 0
          end
        end

        total_hours = services.inject(0) { |out, s| out += s[:hours] } || 0
        update_row(finish, 4, "<<SUM>>", total_hours)

        file = Tempfile.new('test.xls')
        template.write file.path
        Success(file)
      end

      private

      def update_row(row, col, template, value)
        worksheet[row, col] = worksheet[row, col].gsub(template, value.to_s)
      end

      def output_workbook
        @output_workbook ||= Spreadsheet::Workbook.new
      end

      def worksheet
        @worksheet ||= template.worksheets[0]
      end

      def template
        @template_workbook ||= Spreadsheet.open(Wawka.template_path)
      end
    end
  end
end
