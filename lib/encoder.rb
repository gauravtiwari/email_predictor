require 'pry'

class Encoder

  attr_reader :email_format, :domain
  attr_accessor :email

  def initialize(email_format, domain)
    @email_format = email_format
    @domain = domain
  end

  def encode(name)
    fragments = name.downcase.split(' ')
    raise 'This pattern is not a lambda' unless @email_format.lambda?
    @email = email_format.call(fragments) + "@#{domain}"
  end

end
