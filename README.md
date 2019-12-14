# standard_assert

[![Gem Version](https://badge.fury.io/rb/standard_assert.svg)](http://badge.fury.io/rb/standard_assert)
[![Build Status](https://travis-ci.org/yasaichi/standard_assert.svg?branch=master)](https://travis-ci.org/yasaichi/standard_assert)
[![Code Climate](https://codeclimate.com/github/yasaichi/standard_assert/badges/gpa.svg)](https://codeclimate.com/github/yasaichi/standard_assert)
[![Test Coverage](https://codeclimate.com/github/yasaichi/standard_assert/badges/coverage.svg)](https://codeclimate.com/github/yasaichi/standard_assert/coverage)

`standard_assert` is a Standard Library-like library for assertions in Ruby.  
It is aimed at encouraging us to use assertion methods anywhere; Not only testing but also production.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'standard_assert'
```

And then execute:

```
$ bundle
```

## Usage

Use `Assert` module with `extend` or `include` in classes or modules where you want to use assertion methods:

```ruby
require 'standard_assert'

module MyMath
  extend ::Assert

  module_function

  def abs(num)
    assert_instance_of([::Float, ::Integer, ::Rational], num)
    num.positive? ? num : -num
  end
end

MyMath.abs('42')
#=> AssertionError: <"42"> was expected to be instance_of?
#   [<Float>, <Integer>, <Rational>] but was
#   <String>.
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
