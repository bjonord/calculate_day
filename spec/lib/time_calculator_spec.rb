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
    it 'will take 4 parameters and calculate the total hours' do
      hash = spec_vars_8h

      expect(time_calculator.
             calculate( hash ) ).
        to be_instance_of TimeCalculator
    end
  end

  describe "#initialize" do
    it 'will return the calculated hours' do
      hash = spec_vars_8h
      tc = time_calculator.calculate( hash )

      expect( tc.hours ).to eq 8.0
    end

    it 'will return the calculated hours' do
      hash = spec_vars_745h
      tc = time_calculator.calculate( hash )

      expect( tc.hours ).to eq 7.75
    end
  end
end
