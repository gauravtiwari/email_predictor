require 'email_predictor/formatters/encoder'

module EmailPredictor
  describe Formatters::Encoder do
    let(:name) { 'John Ferguson' }
    let(:domain) { 'alphasights.com' }
    let(:given_formats) do
      [
        -> (name) { name.join('.') },
        -> (name) { name.first + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last }
      ]
    end

    context 'I want to format an email addresses' do
      it 'should match to first.last@domain.com email format' do
        email_format = given_formats[0]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'john.ferguson@alphasights.com'
      end

      it 'should match to first.l@domain.com email format' do
        email_format = given_formats[1]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'john.f@alphasights.com'
      end

      it 'should match to f.l@domain.com email format' do
        email_format = given_formats[2]
        encoder = EmailPredictor::Formatters::Encoder.new(email_format, domain)
        encoder.encode(name)
        expect(encoder.email).to eq 'j.f@alphasights.com'
      end

      it 'should match to f.last@domain.com email format' do
        email_format = given_formats[3]
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
