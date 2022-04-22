require 'rails_helper'

RSpec.describe ItemCategoriesController do
  describe 'GET index' do        
    it 'populates an item_categories with category_id' do
      item1 = create(:item_category, category_id: 9, menu_id: 9)
      get :index
      expect(item1.category_id).not_to be nil
    end
    
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do
    it 'assigns the requested item_category to @item_category' do
      item_category = create(:item_category)
      get :show, params: { id: item_category }
      expect(assigns(:item_category)).to eq item_category
    end

    it 'renders the :show template' do
      item_category = create(:item_category)
      get :show, params: { id: item_category }
      expect(response).to render_template :show
    end
  end

  describe 'GET new' do
    it 'assigns a new item_category to @item_category' do
      get :new
      expect(assigns(:item_category)).to be_a_new(ItemCategory)
    end

    it 'renders the :new template' do
      get :new
      expect(:response).to render_template :new
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
       
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  
    context "with invalid attributes" do
      it 'does not save the new item_category in the database' do
        expect{
          post :create, params: { item_category: attributes_for(:invalid_item_category) }
        }.not_to change(ItemCategory, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { item_category: attributes_for(:invalid_item_category) }
        expect(response).to render_template :new
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
        patch :update, params: { id: @item_category, item_category: attributes_for(:item_category, category_id: 17) }
        @item_category.reload
        expect(@item_category.category_id).to eq(17)
      end

      it 'redirects to the item_category' do
        patch :update, params: { id: @item_category, item_category: attributes_for(:item_category) }
        expect(response).to redirect_to @item_category
      end
    end
  
    context "with invalid attributes" do
      it 'does not update the item_category in the database' do
        patch :update, params: { id: @item_category, item_category: attributes_for(:invalid_item_category, category_id: "test", customer_id: "TEST") }
        expect(@item_category.category_id).not_to eq(17)
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: @item_category, item_category: attributes_for(:invalid_item_category) }
        expect(assigns(:item_category)).to eq @item_category
        expect(response).to have_http_status(:unprocessable_entity)
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

    it 'redirects to item_categories index' do
      delete :destroy, params: { id: @item_category }
      expect(response).to redirect_to item_categories_url
    end
  end
end