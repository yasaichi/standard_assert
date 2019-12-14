RSpec.describe Assert do
  subject do
    Class.new do
      include Assert

      def foo
        assert(1 == 2)
      end
    end.new
  end

  it "should raise `AssertionError`" do
    expect { subject.foo }.to raise_error(AssertionError, "<false> is not true.")
  end
end
