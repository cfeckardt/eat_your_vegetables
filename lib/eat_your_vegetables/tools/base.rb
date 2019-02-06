require 'rake/file_list'
require 'open3'

module EatYourVegetables
  module Tools
    class Base
      def initialize(parent_branch:)
        @parent_branch = parent_branch
      end

      def step_difference
        return 0 unless is_configed?

        parent_exclusions = excluded_files(parent_file_contents)
        current_exclusions = excluded_files(current_file_contents)

        (parent_exclusions - current_exclusions).count
      end

      def parent_file_contents
        cmdstr = "git show origin/#{@parent_branch}:#{config_file}"
        stdout, stderr, status = Open3.capture3(cmdstr)

        stdout
      end

      def current_file_contents
        File.read(config_file)
      end

      def is_configed?
        File.file?(config_file) && !parent_file_contents.empty?
      rescue Errno::ENOENT
        false
      end

      protected

      def config_file
        raise NotImplementedError
      end

      def excluded_files(_content)
        raise NotImplementedError
      end
    end
  end
end
