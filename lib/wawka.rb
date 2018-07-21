require "wawka/version"
require "wawka/cli"
require "dry/transaction"
require "dry/transaction/operation"
require "dry/container"
require 'spreadsheet'
require 'yaml'
require 'httparty'
require 'active_support/all'

require 'wawka/harvest'
require 'wawka/infakt'
require 'wawka/container'
require 'wawka/transactions/base'
require 'wawka/transactions/operation'
require 'wawka/transactions/generate_excel'
require 'wawka/transactions/fetch_harvest'
require 'wawka/transactions/generate_evidence'

module Wawka
  def self.root
    @root ||= Pathname.new(File.dirname(File.absolute_path(__FILE__)))
  end

  def self.template_path
    @template_path ||= Wawka.root.join('example/evidence.xls').to_s
  end

  def self.config_path
    @config_path ||= Pathname.new(File.expand_path('~/.wawka.yaml'))
  end

  def self.config
    @config ||= YAML.load(open(config_path.to_s))
  end
end
