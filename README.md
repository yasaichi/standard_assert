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

Since assertion methods are defined as module functions of `Assert`, you can use them as instance methods
to any classes that mix in the module:

```ruby
require 'standard_assert'

class Stack
  include ::Assert

  def initialize
    @store = []
  end

  def pop
    assert(!@store.empty?)
    @store.pop
  end

  def push(element)
    @store.push(element)
    self
  end
end

Stack.new.pop #=> AssertionError (Expected false to be truthy.)
```

Or just call them with the module as a receiver:

```ruby
class Stack
  def peek
    ::Assert.assert(!@store.empty?)
    @store.last
  end
end

Stack.new.peek #=> AssertionError (Expected false to be truthy.)
```

Note that `Assert` provides `aseert` and `assert_*` methods same as in `Minitest::Assertions`
except they throw not `Minitest::Assertion` but `AssertionError` when an assertion fails.

See also: http://docs.seattlerb.org/minitest/Minitest/Assertions.html

## Contributing

You should follow the steps below.

1. [Fork the repository](https://help.github.com/articles/fork-a-repo/)
2. Create a feature branch: `git checkout -b add-new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push the branch: `git push origin add-new-feature`
5. [Send us a pull request](https://help.github.com/articles/about-pull-requests/)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
