# Calculate Day
Just a quick something that I threw together to sum my day at work from 6 parameters.

  In parameters:
  - When the day started. (24h -> hh:mm)
  - When the lunch started. (24h -> hh:mm)
  - When the lunch ended. (24h -> hh:mm)
  - When the day ended. (24h -> hh:mm)
  - How many minutes spent on other breaks. (mm)
  - A comment about the day. (String)

  Output:
  "#{hh:mm}h, #{comment} /#{possible error}"

### This code has not been refactored....

## Structure 
  - bin/  : contains the executable file
  - lib/  : contains the actual class file
  - spec/ : the examples.
