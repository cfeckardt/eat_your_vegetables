module EatYourVegetables
  module Tools
    class Simplecov < Base
      attr_writer :config_file

      protected

      def config_file
        @config_file || 'spec/spec_helper.rb'
      end

      def excluded_files(content)
        # Matches all add_filter in the file.
        # It's imperfect but works for now.
        content.split("\n").select do |line|
          line.include? 'add_filter'
        end.map do |line|
          /[\"'](\S+)[\"']/.match(line.strip).to_s
        end
      end
    end
  end
end
