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
end