# Supported Tools

Currently there is only support for a small number of tools, in ruby, but adding support for _any_ language is easy, and will only take a couple of minutes. See [ADDING_ADAPTERS.md](ADDING_ADAPTERS.md) for instructions.

## Ruby

### Rubocop

The rubocop adapter supports the following options:

```ruby
rubocop do
  config_file ".rubocop.yml" # relative path to the config file, defaults to .rubocop.yml
end
```

Any and all files matched under an `Exclude:` key are considered excluded by this adapter. This means that both `file1.rb` and `file2.rb` are matched.

```yaml
AllCops:
  Exclude:
    - file1.rb
Style/Indentation:
  Exclude:
    - file2.rb
```

### Simplecov

The simplecov adapter supports the following options:

```ruby
simplecov do
  config_file 'spec/spec_helper.rb' # relative path of config file, defaults to spec/spec_helper.rb
end
```

The simplecov adapter will look for _any_ lines in the provided file that includes the line `add_filter "some_file.rb"` and match on `some_file.rb`

Typically you will have something like:

```ruby
Simplecov.start do
  add_filter "file1.rb"
end
```
