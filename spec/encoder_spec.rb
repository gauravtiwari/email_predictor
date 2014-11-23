require 'encoder'

describe Encoder do
  let(:name) { 'John Ferguson' }
  let(:domain) { 'alphasights.com' }

  context 'format email addresses based on given pattern' do
    it 'first.last@domain.com pattern' do
      pattern = :first_name_dot_last_name
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.ferguson@alphasights.com'
    end

    it 'first.l@domain.com pattern' do
      pattern = :first_name_dot_last_initial
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.f@alphasights.com'
    end

    it 'f.l@domain.com pattern' do
      pattern = :first_initial_dot_last_initial
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.f@alphasights.com'
    end

    it 'f.last@domain.com pattern' do
      pattern = :first_initial_dot_last_name
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.ferguson@alphasights.com'
    end
  end

  context 'throw error messages' do
    it 'unavailable pattern' do
      pattern = nil || :bla_bla
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'Unavailable Pattern'
    end
  end
end
