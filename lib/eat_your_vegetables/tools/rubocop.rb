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
        yaml = YAML.load(content)

        yaml['AllCops']['Exclude']
      end
    end
  end
end
