require 'eat_your_vegetables/version'
require 'eat_your_vegetables/tools/rubocop'

module EatYourVegetables
  class Runner
    def initialize
      @tools = []
    end

    def run
      veggies = File.read('Veggiefile')
      instance_eval(veggies)

      @tools.reduce(0) do |acc, tool|
        acc + tool.step_difference
      end
    end

    def ambition
      yield if block_given?
    end

    def rubocop
      @tools << EatYourVegetables::Tools::Rubocop.new(parent_branch: 'master')
    end

    def simplecov
    end

    private
    def step_difference

    end
  end
end
