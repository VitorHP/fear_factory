require 'spec_helper'

describe ApplicationController do

  controller do
    include ApplicationHelper
    def index

    end
  end

  describe 'ApplicationHelper' do
    describe '#display_base_errors' do
      context 'object with no errors' do
        let(:skill){ Skill.new }

        it 'returns an empty string' do
          expect(controller.display_base_errors(skill)).to eq ''
        end
      end

      context 'object with errors' do
        let(:character){ Character.new }

        before do
          character.errors.add(:base, 'tchubas la rubas')
        end

        it 'returns the erros in :base' do
          controller.stub(:content_tag).with(:p, 'tchubas la rubas').and_return('tchubas la rubas')

          expect( controller.display_base_errors(character) ).to match /tchubas la rubas/
        end
      end
    end
  end

end
