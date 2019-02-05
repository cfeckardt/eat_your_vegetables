require 'yaml'
require_relative 'base'

module EatYourVegetables
  module Tools
    class Rubocop < Base
      protected

      def config_file
        '.rubocop.yml'
      end

      def excluded_files(content)
        yaml = YAML.load_file(content)
      end
    end
  end
end
