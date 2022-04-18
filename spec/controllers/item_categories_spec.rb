require 'rails_helper'

RSpec.describe ItemCategoriesController do
  describe 'GET index' do        
    it 'populates an array of all item_categories' do
      item1 = create(:item_category, category_id: 9, item_id: 9)
      item2 = create(:item_category, category_id: 10, item_id: 10)
      get :index
      expect(assigns(:item_categories)).to match_array([item1, item2])
    end
    
    it 'return a 200 OK status' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET new' do
    it 'assigns a new item_category to @item_category' do
      get :new
      expect(assigns(:item_category)).to be_a_new(ItemCategory)
    end

    it 'return a 200 OK status' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'GET edit' do
    it 'assigns the requested item_categories to @item_categories' do
      item_category = create(:item_category)
      get :edit, params: { id: item_category }
      expect(assigns(:item_category)).to eq item_category
    end
    
    it 'renders the :edit template' do
      item_category = create(:item_category)
      get :edit, params: { id: item_category }
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'POST create' do
    context "with valid attributes" do
      it 'saves the new item_category in the database' do
        expect{
          post :create, params: { item_category: attributes_for(:item_category) }
        }.to change(ItemCategory, :count).by(1)
      end

      it 'return a 201 OK status' do
        expect(response).to have_http_status(:ok)
      end
    end
  
    context "with invalid attributes" do
      it 'does not save the new item_category in the database' do
        expect{
          post :create, params: { item_category: attributes_for(:invalid_item_category) }
        }.not_to change(ItemCategory, :count)
      end

      it 'return a 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  
  describe 'PATCH update' do
    before :each do
      @item_category = create(:item_category)
    end
    
    context "with valid attributes" do
      it 'locates the requested @item_category' do
        patch :update, params: { id: @item_category, item_category: attributes_for(:item_category) }
        expect(assigns(:item_category)).to eq @item_category
      end

      it 'changes @item_categoriess attributes' do
        patch :update, params: { id: @item_category, item_category: attributes_for(:item_category, name: 'Nasi Uduk') }
        @item_category.reload
        expect(@item_category.name).to eq('Nasi Uduk')
      end

      it 'return a 200 OK status' do
        expect(response).to have_http_status(:ok)
      end
    end
  
    context "with invalid attributes" do
      it 'does not update the item_category in the database' do
        patch :update, params: { id: @item_category, item_category: attributes_for(:invalid_item_category, name: 'Nasi Uduk', price: "Test") }
        expect(@item_category.name).not_to eq('Nasi Uduk')
      end

      it 'return a 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @item_category = create(:item_category)
    end

    it 'deletes the item_category from the database' do
      expect{
        delete :destroy, params: { id: @item_category }
      }.to change(ItemCategory, :count).by(-1)
    end

    it 'return a 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end
end