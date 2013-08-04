# Getúlio

This gem generates a random working timesheet for every day of the month until today. It is hardcoded for brazilins working time of 44 hours per week. Currently there is no support for flexible time, so every day sums 8 hours and 48 minutes.

## How to use this gem

Just call `Getulio::Timesheet.for_current_month`. This will return a Getulio::Timesheet. To get an array of the days, call `Getulio::Timesheet.for_current_month.days`.

## Support

If you have any questions or suggestions please contact me at twitter (twitter.com/joaohornburg).

## Contributing to Getúlio
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2013 João Hornburg. See LICENSE.txt for
further details.

