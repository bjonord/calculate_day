#!/usr/bin/env ruby
require_relative '../lib/time_calculator'

args = ARGV
attr = [:day_start, :lunch_start, :lunch_end, :day_end]
comment = args.pop
break_time = args.pop

hash = attr.zip args

tc = TimeCalculator.calculate(break_time, comment, hash)

p "#{tc.hours}h, #{tc.comment}"
