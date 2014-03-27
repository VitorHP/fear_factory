require 'spec_helper'

describe Rating do
  it { should belong_to(:rateable) }
  it { should belong_to(:skill) }

  describe 'scopes' do
    let!(:great) { create(:rating, level: 4) }
    let!(:good) { create(:rating, level: 3) }
    let!(:fair) { create(:rating, level: 2) }
    let!(:average) { create(:rating, level: 1) }

    describe '#great' do
      subject{ Rating.great }

      it { should == [great] }
    end

    describe '#good' do
      subject{ Rating.good }

      it { should == [good] }
    end

    describe '#fair' do
      subject{ Rating.fair }

      it { should == [fair] }
    end

    describe '#average' do
      subject{ Rating.average }

      it { should == [average] }
    end
  end
end
