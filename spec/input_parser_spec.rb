require_relative '../lib/input_parser'

RSpec.describe InputParser do
  let(:parser) { described_class.new(input) }
  let(:input) { "2\n5 12\n1 2 3 7 5\n10 15\n1 2 3 4 5 6 7 8 9 10" }
  let(:expected_response) do
    [
      {
        sum: 12,
        array: [1, 2, 3, 7, 5]
      },
      {
        sum: 15,
        array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      }
    ]
  end

  describe "#parse" do
    subject(:parse) { parser.parse }

    it { is_expected.to be_an Array }

    it "will contain at least one hash" do
      expect(parse.first).to be_a Hash
    end

    it "will contain two cases" do
      expect(parse.count).to eq 2
    end

    it "will return a sum for each hash", :aggregate_failures do
      expect(parse.first[:sum]).to_not be nil
      expect(parse.last[:sum]).to_not be nil
    end

    it "the sum for each will be an integer", :aggregate_failures do
      expect(parse.first[:sum]).to be_an Integer
      expect(parse.last[:sum]).to be_an Integer
    end

    it "will return the correct sum", :aggregate_failures do
      expect(parse.first[:sum]).to eq 12
      expect(parse.last[:sum]).to eq 15
    end

    it "will return a array for each hash", :aggregate_failures do
      expect(parse.first[:array]).to_not be nil
      expect(parse.last[:array]).to_not be nil
    end

    it "the array for each will be an integer", :aggregate_failures do
      expect(parse.first[:array]).to be_an Array
      expect(parse.last[:array]).to be_an Array
    end

    it "will return the correct array", :aggregate_failures do
      expect(parse.first[:array]).to eq [1, 2, 3, 7, 5]
      expect(parse.last[:array]).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    end

    it { is_expected.to eq expected_response }
  end
end
