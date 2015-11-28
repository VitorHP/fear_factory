require 'rails_helper'

describe Consequence do
  it { should belong_to(:consequential) }
  it { should belong_to(:skill) }

  describe "#default_scope" do
    let!(:consequence_1){ create :consequence, level: 1 }
    let!(:consequence_2){ create :consequence, level: 2 }

    it 'orders by level' do
      expect(Consequence.all).to eq [consequence_1, consequence_2]
    end
  end

end
