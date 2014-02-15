require 'spec_helper'

describe Swm::CliOptions do
  describe '#initialize' do
    it "should parse empty array" do
      options = Swm::CliOptions.new([])
      expect(options.size).to be_zero
    end

    it "should parse one named option" do
      options = Swm::CliOptions.new(["--foo", "bar"])
      expect(options.size).to eq(1)
      expect(options[:foo]).to eq("bar")
    end

    it "should parse one named option with integer value" do
      options = Swm::CliOptions.new(["--foo", "42"])
      expect(options.size).to eq(1)
      expect(options[:foo]).to eq(42)
    end

    it "should parse multiple named options" do
      options = Swm::CliOptions.new(["--foo", "42", "--bar", "baz"])
      expect(options.size).to eq(2)
      expect(options[:foo]).to eq(42)
      expect(options[:bar]).to eq("baz")
    end

    it "should complain about invalid options" do
      invalid_inputs = [
        ["--foo"],
        ["--foo", "--bar"],
        ["--foo", "42", "--bar"],
        ["42", "--foo"]
      ]
      invalid_inputs.each do |input|
        expect { Swm::CliOptions.new(input) }.to raise_error
      end
    end
  end
end
