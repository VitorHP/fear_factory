require 'spec_helper'

describe BuildCharacter do
  describe '#build' do
    let(:user) { build_stubbed :user }
    let(:campaign) { build_stubbed :fate_core_campaign }

    subject { BuildCharacter.new.build campaign: campaign, user: user }

    it 'builds the character with the campaign params' do
      expect( subject.aspects.size ).to eq 5
    end
  end
end
