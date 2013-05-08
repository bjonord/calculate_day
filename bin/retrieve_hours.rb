#!/usr/bin/env ruby
require_relative '../lib/time_calculator'

args = ARGV
attr = [:day_start, :lunch_start, :lunch_end, :day_end]

hash = attr.zip args

tc = TimeCalculator.calculate(hash)
error = tc.errors.nil? || tc.errors.length <= 0 ? "" : "Input Error: #{tc.errors}"
p "#{tc.hours}h"
