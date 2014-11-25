class Base
  attr_accessor  :decoder, :given_formats,:inspector, :predictions

  def initialize(given_formats)
    @decoder = EmailPredictor::Formatters::Decoder.new(given_formats)
  end

  def context(data)
    @inspector = EmailPredictor::Inspector.new(data, decoder)
    self.inspector.decode_formats
  end

  # Predict array of emails based on patterns and clients.
  # @param name
  # @param domain
  # @return [Array]

  def predict(name, domain)
    return 'Can\'t predict email addresses for this data'  unless inspector.formats[domain]
    encoders = inspector.formats[domain].map {|p| EmailPredictor::Formatters::Encoder.new(p, domain) }
    encoders.map {|encoder| encoder.encode(name) }
  end
end
