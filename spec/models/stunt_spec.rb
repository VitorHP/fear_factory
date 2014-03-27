require 'spec_helper'

describe Stunt do
  it { should belong_to(:stuntable) }

  describe "#default_scope" do
    let!(:stunt_1){ create :stunt, id: 1 }
    let!(:stunt_2){ create :stunt, id: 2 }

    it 'orders by id' do
      expect(Stunt.all).to eq [stunt_1, stunt_2]
    end
  end
end
