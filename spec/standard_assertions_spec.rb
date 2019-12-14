RSpec.describe StandardAssertions do
  it "has a version number" do
    expect(StandardAssertions::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
