require 'encoder'

describe Encoder do
  let(:name) { 'John Ferguson' }
  let(:domain) { 'alphasights.com' }

  context 'I want to format an email addresses' do
    it 'should match to first.last@domain.com email format' do
      email_format = :first_name_dot_last_name
      encoder = Encoder.new(email_format, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.ferguson@alphasights.com'
    end

    it 'should match to first.l@domain.com email format' do
      email_format = :first_name_dot_last_initial
      encoder = Encoder.new(email_format, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.f@alphasights.com'
    end

    it 'should match to f.l@domain.com email format' do
      email_format = :first_initial_dot_last_initial
      encoder = Encoder.new(email_format, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.f@alphasights.com'
    end

    it 'should match to f.last@domain.com email format' do
      email_format = :first_initial_dot_last_name
      encoder = Encoder.new(email_format, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.ferguson@alphasights.com'
    end
  end

  context 'I want to throw an error messages' do
    it 'should match to no email format' do
      email_format = nil || :bla_bla
      encoder = Encoder.new(email_format, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'Unavailable Email Format'
    end
  end
end
