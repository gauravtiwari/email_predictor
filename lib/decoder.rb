class Decoder

  attr_accessor :first_name, :last_name, :email_format, :email_domain, :name

  def decode(email, full_name)
    email_initial, self.email_domain = email.split('@')
    self.first_name, self.last_name = full_name.downcase.split(' ')
    self.email_format = get_format(email_initial)
  end

  def get_format(email_initial)
    case email_initial
    when first_name + "." + last_name
      :first_name_dot_last_name
    when first_name + "." + last_name[0]
      :first_name_dot_last_initial
    when first_name[0] + "." + last_name[0]
      :first_initial_dot_last_initial
    when first_name[0] + "." + last_name
      :first_initial_dot_last_name
    end
  end
end
