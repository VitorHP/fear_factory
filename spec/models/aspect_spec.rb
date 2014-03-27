require 'spec_helper'

describe Aspect do
  it { should belong_to(:aspectable) }

  describe "#default_scope" do
    let!(:aspect_1){ create :aspect, id: 1 }
    let!(:aspect_2){ create :aspect, id: 2 }

    it 'orders by id' do
      expect(Aspect.all).to eq [aspect_1, aspect_2]
    end
  end
end
