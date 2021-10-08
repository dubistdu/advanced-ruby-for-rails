# https://ernie.io/2014/10/23/in-defense-of-alias/

# alias is not a method, but a specially reserved keyword in ruby. It can't be overwritten.
# alias_method is a method defined in module. It can be overwritten, though you shouldn't ever need to.
# in most cases, both can be used interchangeably

class Subscription
  def canceled?
    false
  end

  # since 'alias' is a key word, no comma is needed between cancelled? canceled?
  alias cancelled? canceled?
  # alias_method :cancelled?, :canceled?
end

p Subscription.new.cancelled?

class User
  def name
    "Jasmine"
  end

  # alias doesn NOT run on runtime. It will run at the time of defining the user. 
  # So even though Admin should be printing "Admin" since it's defined later, it prints "Jasmine" because alias runs as User is being defined.

  alias full_name name

  # to override the method, for most time, the better way to alias is to create a deligate method to override. In this case, full_name method.
  def full_name
    name
  end
end 

class Admin < User
  def name
    "Admin"
  end

  def full_name
    name
  end
end

p Admin.new.full_name

