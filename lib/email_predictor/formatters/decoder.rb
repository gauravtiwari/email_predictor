require 'pry'
module EmailPredictor
  module Formatters
    class Decoder
      attr_accessor :given_formats, :email_format, :email_domain, :name

      def initialize(given_formats)
        @given_formats = given_formats
      end

      def decode(email, full_name)
        email_initial, self.email_domain = email.split('@')
        self.name = full_name.downcase.split(' ')
        self.email_format = get_format(email_initial)
      end

      def get_format(email_initial)
        given_formats.select{ |f| f.call(name) == email_initial}
      end

    end
  end
end
