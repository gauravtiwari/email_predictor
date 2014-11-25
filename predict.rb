require_relative 'module'
require 'colorize'

@email_predictor = Base.new(GIVEN_FORMATS)
@email_predictor.context(CLIENTS)

def output(name, domain)
  @email_predictor.predict(name,domain)
end

def output_message(index, name)
  "#{index}.Email predictions for #{name}: \n".colorize(:green).underline
end

TEST.each_with_index do |(name,domain), index|
  puts "\n", output_message(index, name), output(name, domain), "\n"
end
