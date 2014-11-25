require 'pry'

module EmailPredictor
  class Inspector

    attr_accessor :formats
    attr_reader :data, :decoder

    def initialize(data, decoder)
      @formats = {}
      @data = data
      @decoder = decoder
    end

    # Match formats
    # @return [lambda]

    def decode_formats
      data.each do |name, email|
        decoder.decode(email, name)
        formats[decoder.email_domain] ||= decoder.email_format
        formats[decoder.email_domain] += decoder.email_format
        formats[decoder.email_domain].uniq!
      end
    end
  end
end
