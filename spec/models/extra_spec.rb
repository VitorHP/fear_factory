require 'rails_helper'

describe Extra do
  it { should belong_to(:character) }

  describe "#default_scope" do
    let!(:extra_1){ create :extra, id: 1 }
    let!(:extra_2){ create :extra, id: 2 }

    it 'orders by id' do
      expect(Extra.all).to eq [extra_1, extra_2]
    end
  end
end
