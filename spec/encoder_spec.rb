require 'email_predictor/formatters/encoder'
require File.expand_path("../../data/data", __FILE__)

module EmailPredictor
  describe Formatters::Encoder do
    let(:name) { 'John Ferguson' }
    let(:domain) { 'alphasights.com' }

    context 'I want to encode an email addresses' do
      it 'should match to first.last@domain.com email format' do
        email_format = GIVEN_FORMATS[0]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'john.ferguson@alphasights.com'
      end

      it 'should match to first.l@domain.com email format' do
        email_format = GIVEN_FORMATS[1]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'john.f@alphasights.com'
      end

      it 'should match to f.l@domain.com email format' do
        email_format = GIVEN_FORMATS[2]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'j.f@alphasights.com'
      end

      it 'should match to f.last@domain.com email format' do
        email_format = GIVEN_FORMATS[3]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'j.ferguson@alphasights.com'
      end
    end

    context 'I want to throw an error messages' do
      it 'should match to no email format' do
        email_format = nil
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        expect( -> { encoder.encode(name) }).to raise_error
      end
    end
  end
end
