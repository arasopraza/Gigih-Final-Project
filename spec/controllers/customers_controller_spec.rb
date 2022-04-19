require 'rails_helper'

RSpec.describe CustomersController do
  describe 'GET index' do        
    it 'populates an array of all customers' do
        aras = create(:customer, name: "Aras")
        arsy = create(:customer, name: "Arsy")
        get :index
        expect(assigns(:customers)).to match_array([aras, arsy])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end
 
  describe 'GET new' do
    it 'assigns a new customer to @customer' do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end

    it 'renders the :new template' do
      get :new
      expect(:response).to render_template :new
    end
  end
  
  describe 'GET edit' do
    it 'assigns the requested customer to @customer' do
      customer = create(:customer)
      get :edit, params: { id: customer }
      expect(assigns(:customer)).to eq customer
    end
    
    it 'renders the :edit template' do
      customer = create(:customer)
      get :edit, params: { id: customer }
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST create' do
    context "with valid attributes" do
      it 'saves the new customer in the database' do
        expect{
          post :create, params: { customer: attributes_for(:customer) }
        }.to change(Customer, :count).by(1)
      end

      it 'redirects to customer show' do
        post :create, params: { customer: attributes_for(:customer) }
        expect(response).to redirect_to(customer_path(assigns[:customer]))
      end
    end
  
    context "with invalid attributes" do
      it 'does not save the new customer in the database' do
        expect{
          post :create, params: { customer: attributes_for(:invalid_customer) }
        }.not_to change(Customer, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { customer: attributes_for(:invalid_customer) }
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PATCH update' do
    before :each do
      @customer = create(:customer)
    end
    
    context "with valid attributes" do
      it 'locates the requested @customer' do
        patch :update, params: { id: @customer, customer: attributes_for(:customer) }
        expect(assigns(:customer)).to eq @customer
      end

      it 'changes @customers attributes' do
        patch :update, params: { id: @customer, customer: attributes_for(:customer, name: 'Makanan') }
        @customer.reload
        expect(@customer.name).to eq('Makanan')
      end

      it 'redirects to the customer' do
        patch :update, params: { id: @customer, customer: attributes_for(:customer) }
        expect(response).to redirect_to @customer
      end
    end
  
    context "with invalid attributes" do
      it 'does not update the customer in the database' do
        patch :update, params: { id: @customer, customer: attributes_for(:invalid_customer, name: 'Makanan') }
        expect(@customer.name).not_to eq('Makanan')
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: @customer, customer: attributes_for(:invalid_customer) }
        expect(assigns(:customer)).to eq @customer
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @customer = create(:customer)
    end

    it 'deletes the customer from the database' do
      expect{
        delete :destroy, params: { id: @customer }
      }.to change(Customer, :count).by(-1)
    end

    it 'redirects to customers index' do
      delete :destroy, params: { id: @customer }
      expect(response).to redirect_to customers_url
    end
  end
end