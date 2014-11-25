require File.expand_path("../../module", __FILE__)

describe Base do

  let(:email_predictor) { Base.new GIVEN_FORMATS }

  context 'I want to predict email addresses for new formats' do

    it 'should predict correctly when a correct format is present' do
      name, domain = "Peter Wong", "alphasights.com"
      email_predictor.context(CLIENTS)
      expect(email_predictor.predict(name, domain).first).to eq "peter.wong@alphasights.com"
    end

    it 'should predict correctly when a correct format is present (try 2)' do
      name, domain = "Steve Wozniak", "apple.com"
      email_predictor.context(CLIENTS)
      expect(email_predictor.predict(name, domain).first).to eq "s.w@apple.com"
    end

    it 'should predict multiple formats for multiple patterns' do
      name, domain = "Craig Silverstein", "google.com"
      email_predictor.context(CLIENTS)
      expect(email_predictor.predict(name, domain)).to eq ['craig.s@google.com', 'c.silverstein@google.com']
    end

    it 'should return no format' do
      name, domain = "Barack Obama", "whitehouse.gov"
      email_predictor.context(CLIENTS)
      expect(email_predictor.predict(name, domain)).to eq 'Can\'t predict email formats for this data'
    end

  end
end
