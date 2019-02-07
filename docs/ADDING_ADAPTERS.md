# Adding support for more adapters

Currently there is only support for a small number of tools, in ruby, but adding support for _any_ language is easy, and will only take a couple of minutes.

You may use the example below to implement your own adapter:

```ruby
require_relative 'base'

module EatYourVegetables
  module Tools # Create your tool in this namespace
    class MyTool < Base # Inherit from the base tool
      attr_writer :config_file # Add attr_writers for configurable values
      protected
      # Will get called when running the tool to determine
      # the location of the config file (across branches)
      def config_file # You need to implement this method
        @config_file || '.mytoolignore.yml' # Default value
      end

      # Will get called with the contents of the config_file, for the valid branches.
      # Should return an array of files excluded by the content
      def excluded_files(content) # You need to implement this method
        content.split("\n")
      end
    end
  end
end

```

