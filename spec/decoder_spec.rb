require 'decoder'

describe Decoder do
  context 'I want to extract attributes from a given email' do

      let(:decoder) { Decoder.new }

      it 'should match to first_name.last_name@domain.com email format' do
        name = 'John Ferguson'
        email = 'john.ferguson@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_domain).to eq 'alphasights.com'
        expect(decoder.first_name).to eq 'john'
        expect(decoder.last_name).to eq 'ferguson'
        expect(decoder.email_format).to eq :first_name_dot_last_name
      end

      it 'should match to first_name.last_initial@domain.com email format' do
        name = 'John Ferguson'
        email = 'john.f@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format).to eq :first_name_dot_last_initial
      end

      it 'should match to first_initial.last_initial@domain.com email format' do
        name = 'John Ferguson'
        email = 'j.f@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format).to eq :first_initial_dot_last_initial
      end

      it 'should match to first_initial.last_name@domain.com email format' do
        name = 'John Ferguson'
        email = 'j.ferguson@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format).to eq :first_initial_dot_last_name
      end

      it 'should match to no email format' do
        name = 'John Doe'
        email = 'john.ferguson@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format).to eq nil
      end

    end
  end
