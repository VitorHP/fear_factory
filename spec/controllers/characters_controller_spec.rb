require 'rails_helper'

describe CharactersController, type: :controller do

  let(:user){ create(:user) }
  let!(:character){ create(:character, user_id: user.id) }
  let(:campaign){ create(:fate_core_campaign) }

  before do
    sign_in create(:user)
  end

  describe '#new' do

    it 'assigns @character' do
      get :new

      expect(assigns[:character]).not_to be_nil
    end
  end

  describe '#create' do
    describe 'with valid attributes' do
      it 'creates a new character' do
        expect{
          post :create, character: attributes_for(:character), campaign_id: campaign
        }.to change( Character, :count ).by(1)
      end

      it 'redirects to index page' do
        post :create, character: attributes_for(:character), campaign_id: campaign
        expect(response).to redirect_to root_path
      end
    end

    describe 'with invalid attributes' do
      it 'does not create the new character' do
        expect{
          post :create, character: { name: nil }, campaign_id: campaign
        }.not_to change(Character, :count)
      end

      it 're-renders the "new" template' do
        post :create, character: { name: nil }, campaign_id: campaign
        expect(response).to render_template :new
      end
    end

  end

  describe '#update' do
    let(:character){ create :character, name: "Jim", user_id: user.id }
    let(:character_attributes) { attributes_for(:character, name: "Charles") }

    describe 'with valid attributes' do

      it 'locates the requested @character' do
        patch :update, id: character, character: character_attributes, campaign_id: campaign
        expect(assigns[:character]).to eq(character)
      end

      it 'updates the character' do
        patch :update, id: character, character: character_attributes, campaign_id: campaign
        character.reload
        expect(character.name).to eq "Charles"
      end

      it 'redirects to index page' do
        patch :update, id: character, character: attributes_for(:character), campaign_id: campaign
        expect(response).to redirect_to root_path
      end
    end

    describe 'with invalid attributes' do
      it 'locates the requested @character' do
        patch :update, id: character, character: { name: nil }, campaign_id: campaign
        expect(assigns[:character]).to eq(character)
      end

      it 'does not change the character' do
        patch :update, id: character, character: { name: nil }, campaign_id: campaign
        character.reload
        expect(character.name).to eq "Jim"
      end

      it 're-renders the "edit" template' do
        patch :update, id: character, character: { name: nil }, campaign_id: campaign
        expect(response).to render_template :edit
      end
    end

  end
end
