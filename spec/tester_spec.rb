require 'email_predictor/inspector'
require 'email_predictor/formatters/decoder'

module EmailPredictor
  describe Inspector do

    let(:given_formats) do
      [ -> (name) { name.join('.') },
        -> (name) { name.first + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last }
      ]
      end

    let(:data) do {
        "John Ferguson" => "john.ferguson@alphasights.com",
        "Damon Aw" => "damon.aw@alphasights.com",
        "Linda Li" => "linda.li@alphasights.com",
        "Larry Page" => "larry.p@google.com",
        "Sergey Brin" => "s.brin@google.com",
        "Steve Jobs" => "s.j@apple.com"
      }
    end

    let(:inspector) {
      EmailPredictor::Inspector.new data,
      EmailPredictor::Formatters::Decoder.new(given_formats)
    }

    before {inspector.decode_formats}

    context 'I have unique formats' do
      it 'should match to first_name_dot_last_name format' do
        expect(inspector.formats['alphasights.com'].first).to eq given_formats[0]
      end
      it 'should match to first_initial_dot_last_initial format' do
        expect(inspector.formats['apple.com'].first).to eq given_formats[2]
      end
    end
    context 'I have non-unique formats' do
      it 'should return all available formats' do
        expect(inspector.formats['google.com']).to eq [given_formats[1], given_formats[3]]
      end
    end
  end
end
