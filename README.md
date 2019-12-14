# standard_assertions

`standard_assertions` is a Standard Library-like library for assertions in Ruby.  
It is aimed at encouraging us to use assertion methods anywhere; Not only testing but also production.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'standard_assertions'
```

And then execute:

```
$ bundle
```

## Usage

Use `Assertions` module with `extend` or `include` in classes or modules where you want to use assertion methods:

```ruby
require 'standard_assertions'

module MyMath
  extend ::Assertions

  module_function def abs(x)
    assert_kind_of(::Numeric, x)
    x > 0 ? x : -x
  end
end

MyMath.abs('42')
#=> AssertionFailedError:
#     <"42"> was expected to be kind_of?
#     <Numeric> but was
#     <String>.
```

## Contributing

You should follow the steps below.

1. [Fork the repository](https://help.github.com/articles/fork-a-repo/)
2. Create a feature branch: `git checkout -b add-new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push the branch: `git push origin add-new-feature`
5. [Send us a pull request](https://help.github.com/articles/about-pull-requests/)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
