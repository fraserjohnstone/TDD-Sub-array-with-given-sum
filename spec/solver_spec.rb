require_relative '../lib/solver'

RSpec.describe Solver do
  let(:solver) { described_class.new(input) }
  let(:input) { "2\n5 12\n1 2 3 7 5\n10 15\n1 2 3 4 5 6 7 8 9 10" }
  let(:expected_response) do
    "2 4\n1 5"
  end

  describe "#solve" do
    subject(:solve) { solver.solve }

    it { is_expected.to be_a String }

    it "will have the correct number of lines (one per test case)" do
      expect(solve.split("\n").count).to eq 2
    end

    it "will have two characters split by a space on each line", :aggregate_failures do
      line1 = solve.split("\n").first
      line2 = solve.split("\n").last

      chars1 = line1.split(' ')
      chars2 = line2.split(' ')

      expect(chars1.count).to eq 2
      expect(chars2.count).to eq 2
    end

    it { is_expected.to eq expected_response }
  end
end
