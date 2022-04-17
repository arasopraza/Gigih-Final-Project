require 'rails_helper'

RSpec.describe MenusController do
  describe 'GET index' do        
    it 'populates an array of all menus' do
        nasi_goreng = create(:menu, name: "Nasi Goreng")
        nasi_uduk = create(:menu, name: "Nasi Uduk")
        get :index
        expect(assigns(:menus)).to match_array([nasi_goreng, nasi_uduk])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET show' do
    it 'assigns the requested menu to @menu' do
      menu = create(:menu)
      get :show, params: { id: menu }
      expect(assigns(:menu)).to eq menu
    end

    it 'renders the :show template' do
      menu = create(:menu)
      get :show, params: { id: menu }
      expect(response).to render_template :show
    end
  end
  
  describe 'GET new' do
    it 'assigns a new menu to @menu' do
      get :new
      expect(assigns(:menu)).to be_a_new(Menu)
    end

    it 'renders the :new template' do
      get :new
      expect(:response).to render_template :new
    end
  end
  
  describe 'GET edit' do
    it 'assigns the requested menu to @menu' do
      menu = create(:menu)
      get :edit, params: { id: menu }
      expect(assigns(:menu)).to eq menu
    end
    
    it 'renders the :edit template' do
      menu = create(:menu)
      get :edit, params: { id: menu }
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST create' do
    context "with valid attributes" do
      it 'saves the new menu in the database' do
        expect{
          post :create, params: { menu: attributes_for(:menu) }
        }.to change(Menu, :count).by(1)
      end

      it 'redirects to menu show' do
        post :create, params: { menu: attributes_for(:menu) }
        expect(response).to redirect_to(menu_path(assigns[:menu]))
      end
    end
  
    context "with invalid attributes" do
      it 'does not save the new menu in the database' do
        expect{
          post :create, params: { menu: attributes_for(:invalid_menu) }
        }.not_to change(Menu, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { menu: attributes_for(:invalid_menu) }
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PATCH update' do
    before :each do
      @menu = create(:menu)
    end
    
    context "with valid attributes" do
      it 'locates the requested @menu' do
        patch :update, params: { id: @menu, menu: attributes_for(:menu) }
        expect(assigns(:menu)).to eq @menu
      end

      it 'changes @menus attributes' do
        patch :update, params: { id: @menu, menu: attributes_for(:menu, name: 'Nasi Uduk') }
        @menu.reload
        expect(@menu.name).to eq('Nasi Uduk')
      end

      it 'redirects to the menu' do
        patch :update, params: { id: @menu, menu: attributes_for(:menu) }
        expect(response).to redirect_to @menu
      end
    end
  
    context "with invalid attributes" do
      it 'does not update the menu in the database' do
        patch :update, params: { id: @menu, menu: attributes_for(:invalid_menu, name: 'Nasi Uduk', price: "Test") }
        expect(@menu.name).not_to eq('Nasi Uduk')
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: @menu, menu: attributes_for(:invalid_menu) }
        expect(assigns(:menu)).to eq @menu
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @menu = create(:menu)
    end

    it 'deletes the menu from the database' do
      expect{
        delete :destroy, params: { id: @menu }
      }.to change(Menu, :count).by(-1)
    end

    it 'redirects to menus index' do
      delete :destroy, params: { id: @menu }
      expect(response).to redirect_to menus_url
    end
  end
end