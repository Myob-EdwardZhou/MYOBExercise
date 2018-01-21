# frozen_string_literal: true

RSpec.describe StringHelper do
  include StringHelper

  describe '.percentage_to_float' do
    let(:percentage) { '99.9%' }

    subject { percentage_to_float(percentage) }

    it { is_expected.to eq 0.999 }
  end
end
