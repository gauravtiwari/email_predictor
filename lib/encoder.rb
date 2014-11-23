class Encoder

  attr_reader :pattern, :domain
  attr_accessor :email

  def initialize(pattern, domain)
    @pattern = pattern
    @domain = domain
  end

  def encode(name)
    fragments = name.downcase.split(' ')
    case pattern
      when :first_name_dot_last_name
        self.email = fragments.join('.') + "@#{domain}"
      when :first_name_dot_last_initial
        self.email = fragments.first + '.' + fragments.last[0] + "@#{domain}"
      when :first_initial_dot_last_initial
        self.email = fragments.first[0] + '.' + fragments.last[0] + "@#{domain}"
      when :first_initial_dot_last_name
        self.email = fragments.first[0] + '.' + fragments.last + "@#{domain}"
      else
        self.email = "Unavailable Pattern"
    end
  end

end
