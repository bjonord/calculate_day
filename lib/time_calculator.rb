class TimeCalculator
  attr_reader :hours, :comment, :errors

  def self.calculate(options = {})
    TimeCalculator.new(options)
  end

  def initialize(options)
    @options = options

    set_hours
  end

  private

  def test_inputs
    checked = @options.map do |k, v|
      v =~ /^\d\d:\d\d$/
    end

    if checked.include? nil
      raise ArgumentError, 'You are doing it wrong!'
    else
      true
    end
  end

  def find_hours
    new_options = @options.inject({}) do |hash, (key, val)|
      hash[key] = val.split(":")
      hash
    end
    @options = new_options
    total
  end

  def set_hours
    begin
      @hours = find_hours if test_inputs
    rescue ArgumentError => e
      @errors = e.message
    end
  end

  def start_of_day
    (@options[:day_start].first.to_i * 60) + @options[:day_start].last.to_i
  end

  def end_of_day
    (@options[:day_end].first.to_i * 60) + @options[:day_end].last.to_i
  end

  def lunch_end
    (@options[:lunch_end].first.to_i * 60) + @options[:lunch_end].last.to_i
  end

  def lunch_start
    (@options[:lunch_start].first.to_i * 60) + @options[:lunch_start].last.to_i
  end

  def total
    ((end_of_day - start_of_day - (lunch_end - lunch_start) -
        @break_time.to_i).to_f / 60.to_f).round(2)
  end
end
