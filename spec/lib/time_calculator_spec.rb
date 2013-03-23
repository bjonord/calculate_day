require_relative "../../lib/time_calculator"

def spec_vars_8h
  hash = {}
  hash[:day_start] = "08:10"
  hash[:lunch_start] = "11:30"
  hash[:lunch_end] = "12:30"
  hash[:day_end] = "17:10"
  hash
end

def spec_vars_745h
  hash = {}
  hash[:day_start] = "08:10"
  hash[:lunch_start] = "11:30"
  hash[:lunch_end] = "12:30"
  hash[:day_end] = "16:55"
  hash
end

describe TimeCalculator do
  subject(:time_calculator) { TimeCalculator }
  describe "#calculate" do
    # day_start
    # lunch start
    # lunch end
    # day_end
    # break_time
    # comment

    it 'will take 4 parameters and calculate the total hours' do
      hash = spec_vars_8h
      break_time = "20"
      comment = "this should be a comment"

      expect(time_calculator.
             calculate(break_time, comment, hash) ).
        to be_instance_of TimeCalculator
    end
  end

  describe "#initialize" do
    it 'will return the calculated hours and the comments' do
      hash = spec_vars_8h
      break_time = "20"
      comment = "this should be a comment2"
      tc = time_calculator.calculate(break_time, comment, hash )

      expect( tc.hours ).to eq 7.67
      expect( tc.comment ).to eq "this should be a comment2"
    end

    it 'will return the calculated hours and the comments' do
      hash = spec_vars_745h
      break_time = "20"
      comment = "this should be a comment2"
      tc = time_calculator.calculate(break_time, comment, hash )

      expect( tc.hours ).to eq 7.42
      expect( tc.comment ).to eq "this should be a comment2"
    end
  end
end
