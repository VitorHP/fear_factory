require 'spec_helper'

describe CharactersController, type: :controller do
  login_user

  let!(:character){ create(:character, user_id: User.first.id) }

  describe '#index' do

    it 'assigns @characters' do
      get :index

      expect(assigns[:characters]).to eq [character]
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    let(:skill){ create(:skill) }

    it 'assings @skills' do
      get :new

      expect(assigns[:skills]).to eq [skill]
    end

    it 'assigns @character' do
      get :new

      expect(assigns[:character]).not_to be_nil
    end
  end

  describe '#create' do
    describe 'with valid attributes' do
      it 'creates a new character' do
        expect{
          post :create, character: attributes_for(:character)
        }.to change( Character, :count ).by(1)
      end

      it 'redirects to index page' do
        post :create, character: attributes_for(:character)
        expect(response).to redirect_to characters_path
      end
    end

    describe 'with invalid attributes' do
      it 'does not create the new character' do
        expect{
          post :create, character: { name: nil }
        }.not_to change(Character, :count)
      end

      it 're-renders the "new" template' do
        post :create, character: { name: nil }
        expect(response).to render_template :new
      end
    end

  end
end
