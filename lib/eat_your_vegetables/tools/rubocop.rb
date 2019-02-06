require 'yaml'
require_relative 'base'

module EatYourVegetables
  module Tools
    class Rubocop < Base
      attr_writer :config_file

      protected

      def config_file
        @config_file || '.rubocop.yml'
      end

      def excluded_files(content)
        yaml = YAML.load(content)

        yaml.values.reduce([]) do |acc, hash|
          acc << hash['Exclude']
        end.compact.sort.uniq
      end
    end
  end
end
