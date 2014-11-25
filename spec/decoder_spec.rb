require 'email_predictor/formatters/decoder'
require File.expand_path("../../data/data", __FILE__)

module EmailPredictor
  describe Formatters::Decoder do
    context 'I want to decode attributes from a given email' do

        let(:decoder) { EmailPredictor::Formatters::Decoder.new GIVEN_FORMATS }

        it 'should match to first_name.last_name@domain.com email format' do
          name = 'John Ferguson'
          email = 'john.ferguson@alphasights.com'
          decoder.decode(email, name)
          expect(decoder.email_domain).to eq 'alphasights.com'
          expect(decoder.name).to eq ['john', 'ferguson']
          expect(decoder.email_format.first).to eq GIVEN_FORMATS[0]
        end

        it 'should match to first_name.last_initial@domain.com email format' do
          name = 'John Ferguson'
          email = 'john.f@alphasights.com'
          decoder.decode(email, name)
          expect(decoder.email_format.first).to eq GIVEN_FORMATS[1]
        end

        it 'should match to first_initial.last_initial@domain.com email format' do
          name = 'John Ferguson'
          email = 'j.f@alphasights.com'
          decoder.decode(email, name)
          expect(decoder.email_format.first).to eq GIVEN_FORMATS[2]
        end

        it 'should match to first_initial.last_name@domain.com email format' do
          name = 'John Ferguson'
          email = 'j.ferguson@alphasights.com'
          decoder.decode(email, name)
          expect(decoder.email_format.first).to eq GIVEN_FORMATS[3]
        end

        it 'should match to no email format' do
          name = 'John Doe'
          email = 'john.ferguson@alphasights.com'
          decoder.decode(email, name)
          expect(decoder.email_format.first).to eq nil
        end
    end
  end
end
