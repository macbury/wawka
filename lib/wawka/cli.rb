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

    desc "clients", "list all infakt clients with their ids"
    def clients
      
    end

    desc "invoice <date>", "create invoice and download pdf"
    def invoice(create)
      
    end

    desc "ogarnij <date>", "create evidence, create invoice and send it using email"
    def ogarnij(date)
      
    end

    desc "mail", "send example mail"
    def mail
      
    end

    desc "config", "copy example configuration file"
    def config
      raise "There is already: #{Wawka.config_path}" if Wawka.config_path.exist?
      FileUtils.cp(
        Wawka.root.join('example/config.yml'),
        Wawka.config_path.to_s
      )
      puts "Edit your configuration file under: #{Wawka.config_path}"
    end
  end
end
