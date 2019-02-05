require 'rake/file_list'
require 'open3'

module EatYourVegetables
  module Tools
    class Base
      def initialize(parent_branch:)
        @parent_branch = parent_branch
        @ambition_filter = []
      end

      def filter(file)
        if file.is_a? Array
          file.each do |f|
            self.filter f
          end
        end

        @ambition_filter << file
      end

      def step_difference
        parent_exclusions = excluded_files(parent_file_contents)
        current_exclusions = excluded_files(current_file_contents)

        (current_exclusions - parent_exclusions).count
      end

      def parent_file_contents
        cmdstr = "git show origin/master:#{config_file}"
        stdout, stderr, status = Open3.capture3(cmdstr)

        stdout
      end

      def current_file_contents
        File.read(config_file)
      end

      protected

      def config_file
        raise NotImplementedError
      end

      def excluded_files(content)
        raise NotImplementedError
      end
    end
  end
end
