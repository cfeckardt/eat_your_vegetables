# Eat Your Vegetables

* [Homepage](https://rubygems.org/gems/eat_your_vegetables)
* [Documentation](http://rubydoc.info/gems/eat_your_vegetables/frames)
* [Email](mailto:cfeckardt@gmail.com)

## Description
Eat Your Vegetables is a tool that aims to help you improve your codebase over
time. You configure the ambition that you want to set, that is, which files do
you want to be covered by your test tools in an ideal world. Then, every time a
commit is made into your code base, Eat Your Vegetables will ensure that your
are one incremental step closer to that goal.

Run Eat Your Vegetables in your CI server, as part of your test suite. On every
test run it will then look at the previous state, count up the number of
excluded files from your linter/test framework/coverage and _fail_ your tests if
that number hasn't decreased.

## Features
Support for linters, coverage and test tools. For a full list of support tools
see SUPPORTED_TOOLS.md

This project is still in early days so _please_ add support for your framework
if it is missing. There is a simple guide here: ADDING_FRAMEWORKS.md

## Requirements

A newish version of git must be installed on the CI server. Your CI server must
be executing your environment with git available.

## Install

    $ gem install eat_your_vegetables

## Running it

Eat Your Vegetables is intended to be run with

### With docker
For all you hip kids out there, there's a Dockerfile!

`docker run eat_your_vegetables:latest`

## Configuration

In the root of your project create a file named `Veggiefile`

```ruby
ambition do
  include '/'
end

rubocop
simplecov
```

### Setting up CI

#### Gitlab

#### Circle CI

#### Other

Please contribute by adding set up instructions for other CIs.

## Contributing

Nothing special here! Contributions are welcome!

## Copyright

Copyright (c) 2019 Fredrik Eckardt

See {file:LICENSE.txt} for details.
