require 'eat_your_vegetables/version'
require 'eat_your_vegetables/tools/rubocop'

require 'colorize'

module EatYourVegetables
  class Runner
    def initialize
      @tools = []
    end

    def run
      veggies = File.read('Veggiefile')
      instance_eval(veggies)

      step_difference = @tools.reduce(0) do |acc, tool|
        (acc + tool.step_difference)
      end

      if @tools.any? &:is_configed?
        if step_difference == 0
          puts "Sorry, I can't let you do that".yellow
          puts "Please, fix one of the ignored files and try again!".yellow
          puts "For example:".yellow

          @tools.flat_map(&:current_exclusions).flatten.sort.sample(10).each do |excluded_file|
            puts excluded_file.red
          end

          exit 1
        else
          puts "Thanks, for eating your veggies.".green
          exit 0
        end
      else
        puts 'It appears there are no vegetables to eat'.blue
        exit 0
      end
    end

    def ambition
      yield if block_given?
    end

    def rubocop
      @tools << EatYourVegetables::Tools::Rubocop.new(parent_branch: 'master')
    end

    def simplecov; end

    private

    def step_difference; end
  end
end
