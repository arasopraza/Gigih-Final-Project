require 'rails_helper'

RSpec.describe OrdersController do
  describe 'GET index' do
    before :each do
        @customer = create(:customer)
    end     

    it 'populates an array of all orders' do
        order = create(:order, customer_id: @customer.id)
        get :index
        expect(assigns(:orders)).to match_array([order])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET show' do
    it 'assigns the requested order to @order' do
      order = create(:order)
      get :show, params: { id: order }
      expect(assigns(:order)).to eq order
    end

    it 'renders the :show template' do
      order = create(:order)
      get :show, params: { id: order }
      expect(response).to render_template :show
    end
  end
  
  describe 'GET new' do
    it 'assigns a new order to @order' do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end

    it 'renders the :new template' do
      get :new
      expect(:response).to render_template :new
    end
  end
  
  describe 'GET edit' do
    it 'assigns the requested order to @order' do
      order = create(:order)
      get :edit, params: { id: order }
      expect(assigns(:order)).to eq order
    end
    
    it 'renders the :edit template' do
      order = create(:order)
      get :edit, params: { id: order }
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST create' do
    context "with valid attributes" do
      it 'saves the new order in the database' do
        expect{
          post :create, params: { order: attributes_for(:order) }
        }.to change(order, :count).by(1)
      end

      it 'redirects to order show' do
        post :create, params: { order: attributes_for(:order) }
        expect(response).to redirect_to(order_path(assigns[:order]))
      end
    end
  
    context "with invalid attributes" do
      it 'does not save the new order in the database' do
        expect{
          post :create, params: { order: attributes_for(:invalid_order) }
        }.not_to change(order, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { order: attributes_for(:invalid_order) }
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PATCH update' do
    before :each do
      @order = create(:order)
    end
    
    context "with valid attributes" do
      it 'locates the requested @order' do
        patch :update, params: { id: @order, order: attributes_for(:order) }
        expect(assigns(:order)).to eq @order
      end

      it 'changes @orders attributes' do
        patch :update, params: { id: @order, order: attributes_for(:order, status: 'PAID') }
        @order.reload
        expect(@order.name).to eq('PAID')
      end

      it 'redirects to the order' do
        patch :update, params: { id: @order, order: attributes_for(:order) }
        expect(response).to redirect_to @order
      end
    end
  
    context "with invalid attributes" do
      it 'does not update the order in the database' do
        patch :update, params: { id: @order, order: attributes_for(:invalid_order, status: "NEW") }
        expect(@order.status).not_to eq('NEW')
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: @order, order: attributes_for(:invalid_order) }
        expect(assigns(:order)).to eq @order
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
