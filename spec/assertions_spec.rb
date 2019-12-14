RSpec.describe Assertions do
  subject { Class.new { include Assertions; def foo; assert(1 == 2); end }.new }

  it "should raise `AssertionFailedError`" do
    expect { subject.foo }.to raise_error(AssertionFailedError, "<false> is not true.")
  end
end
