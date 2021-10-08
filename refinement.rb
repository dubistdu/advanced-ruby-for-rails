# *Monkey Patching
# In Ruby, a Monkey Patch (MP) is referred to as a dynamic modification to a class and by a dynamic modification to a class means to add new or overwrite existing methods at runtime. This ability is provided by ruby to give more flexibility to the coders.

# *Using refinement for safer Monkey fetching

# Monkey patching can lead to really painful debugging if you accidentally override someone else's monkey patch. 

# Ruby introduced refinements to keep monkey patches organized and explicit. We'll walk through how to use those to keep our monkey patches safe.
require 'active_support/all'

# example) refining Integer class
module TimeHelpers
  refine Integer do
    def hours
      30 * minutes
    end

    def minutes
      60 * self
    end

    def days
      24 * hours
    end
  end
end

# this can be used locally and globally
# if used globally, 

# this uses active_support Duration 
puts 2.hours.ago

class Person
  using TimeHelpers

  def reminder
    2.hours
  end
end

# this uses TimeHelpers
reminder = Person.new.reminder

puts reminder

### DO USE refinement only when you absolutely need to Monkey patch. It's not a good practice in general. ###
### When monkey patching is handy is when something like new version of active storage is out and you are not ready to upgrade the rails app yet, you can go copy the code from new version and do a Monkey patch. Then when you are ready to upgrade to a newer version, delete monkey patch and upgrade. Since it's the same code there shouldn't be issues when upgrading the app.