require 'email_predictor/inspector'
require 'email_predictor/formatters/decoder'
require File.expand_path("../../data/data", __FILE__)

module EmailPredictor
  describe Inspector do

    let(:inspector) {
      EmailPredictor::Inspector.new CLIENTS,
      EmailPredictor::Formatters::Decoder.new(GIVEN_FORMATS)
    }

    before {inspector.decode_formats}

    context 'I have unique formats' do
      it 'should match to first_name_dot_last_name format' do
        expect(inspector.formats['alphasights.com'].first).to eq GIVEN_FORMATS[0]
      end
      it 'should match to first_initial_dot_last_initial format' do
        expect(inspector.formats['apple.com'].first).to eq GIVEN_FORMATS[2]
      end
    end
    context 'I have many email formats' do
      it 'should return all available formats' do
        expect(inspector.formats['google.com']).to eq [GIVEN_FORMATS[1], GIVEN_FORMATS[3]]
      end
    end
  end
end
