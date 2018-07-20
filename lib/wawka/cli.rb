require 'thor'
module Wawka
  class Cli < Thor
    desc "harvest <output-file> <date>", "generate required excel evidence based on harvest data"
    def harvest(output_file, date=Date.today)
      Transactions::GenerateEvidence.new(date).call do |resp|
        resp.success do |file|
          FileUtils.cp(file.path, output_file)
          puts "Generated evidence: #{output_file}"
        end

        resp.failure {}
      end
    end

    desc "config", "copy example configuration file"
    def config
      raise "There is already: #{Wawka.config_path}" if Wawka.config_path.exist?
      FileUtils.cp(
        Wawka.root.join('example/config.yml'),
        Wawka.config_path.to_s
      )
    end
  end
end
