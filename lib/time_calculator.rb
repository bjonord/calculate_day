class TimeCalculator
  attr_reader :hours, :comment

  def self.calculate(break_time = nil, comment = nil, options = {})
    TimeCalculator.new(break_time, comment, options)
  end

  def initialize(break_time, comment, options)
    @options = options
    @break_time = break_time.nil? ? 0 : break_time
    @comment = comment
    @hours = find_hours if test_inputs
  end

  def test_inputs
    checked = @options.map do |k, v|
      v =~ /^\d\d:\d\d$/
    end

    if checked.include? nil
      false
    else
      true
    end
  end

  def find_hours
    @new_options = @options.inject({}) do |hash, option|
      hash[option.first] = option.last.split(":")
      hash
    end

    total
  end

  private

  def start_of_day
    (@new_options[:day_start].first.to_i * 60) + @new_options[:day_start].last.to_i
  end

  def end_of_day
    (@new_options[:day_end].first.to_i * 60) + @new_options[:day_end].last.to_i
  end

  def lunch_end
    (@new_options[:lunch_end].first.to_i * 60) + @new_options[:lunch_end].last.to_i
  end

  def lunch_start
    (@new_options[:lunch_start].first.to_i * 60) + @new_options[:lunch_start].last.to_i
  end

  def total
    ((end_of_day - start_of_day - (lunch_end - lunch_start) -
        @break_time.to_i).to_f / 60.to_f).round(2)
  end
end
