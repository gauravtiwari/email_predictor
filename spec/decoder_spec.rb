require 'decoder'

describe Decoder do
  context 'I want to extract attributes from a given email' do

    let(:given_formats) do
      [ -> (name) { name.join('.') },
        -> (name) { name.first + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last }
      ]
      end


      let(:decoder) { Decoder.new given_formats }

      it 'should match to first_name.last_name@domain.com email format' do
        name = 'John Ferguson'
        email = 'john.ferguson@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_domain).to eq 'alphasights.com'
        expect(decoder.name).to eq ['john', 'ferguson']
        expect(decoder.email_format.first).to eq given_formats[0]
      end

      it 'should match to first_name.last_initial@domain.com email format' do
        name = 'John Ferguson'
        email = 'john.f@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format.first).to eq given_formats[1]
      end

      it 'should match to first_initial.last_initial@domain.com email format' do
        name = 'John Ferguson'
        email = 'j.f@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format.first).to eq given_formats[2]
      end

      it 'should match to first_initial.last_name@domain.com email format' do
        name = 'John Ferguson'
        email = 'j.ferguson@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format.first).to eq given_formats[3]
      end

      it 'should match to no email format' do
        name = 'John Doe'
        email = 'john.ferguson@alphasights.com'
        decoder.decode(email, name)
        expect(decoder.email_format.first).to eq nil
      end

    end
  end
