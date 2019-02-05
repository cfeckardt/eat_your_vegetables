lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eat_your_vegetables/version'

Gem::Specification.new do |gem|
  gem.name          = 'eat_your_vegetables'
  gem.version       = EatYourVegetables::VERSION
  gem.summary       = 'Eat Your Vegetables lets you incrementally improve code quality over time'
  gem.description   = 'Use EYV to incrementally improve code quality in your project.
Force your team to incrementally improve your code base with every commit to master.'
  gem.license       = 'MIT'
  gem.authors       = ['Fredrik Eckardt']
  gem.email         = 'cfeckardt@gmail.com'
  gem.homepage      = 'https://rubygems.org/gems/eat_your_vegetables'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)

  `git submodule --quiet foreach --recursive pwd`.split($INPUT_RECORD_SEPARATOR).each do |submodule|
    submodule.sub!("#{Dir.pwd}/", '')

    Dir.chdir(submodule) do
      `git ls-files`.split($INPUT_RECORD_SEPARATOR).map do |subpath|
        gem.files << File.join(submodule, subpath)
      end
    end
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rake', '~> 12.3.2'

  gem.add_development_dependency 'bundler', '~> 1.10'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
