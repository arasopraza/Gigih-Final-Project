require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is valid with a name, phone, address' do
    customer = FactoryBot.build(:customer)
    expect(customer).to be_valid
  end

  it 'is invalid without a name' do
    customer = FactoryBot.build(:customer, name: nil)
    customer.valid?
    expect(customer.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a phone' do
    customer = FactoryBot.build(:customer, phone: nil)
    customer.valid?
    expect(customer.errors[:phone]).to include("can't be blank")
  end

  it"should have_many :orders" do
    expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
  end
end
