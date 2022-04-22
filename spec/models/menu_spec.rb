require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is valid with a name and a description' do
    menu = FactoryBot.build(:menu)
    expect(menu).to be_valid
  end

  it 'is invalid without a name' do
    menu = FactoryBot.build(:menu, name: nil)
    menu.valid?
    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a non numeric values price' do
    menu = FactoryBot.build(:menu, price: 'Rp.5000')
    menu.valid?
    expect(menu.errors[:price]).to include("is not a number")
  end

  it 'is invalid with a price less than 0.01' do
    menu = FactoryBot.build(:menu, price: 0.002)
    menu.valid?
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it 'is invalid with a name less than 2 words' do
    menu = FactoryBot.build(:menu, name: 'N')
    menu.valid?
    expect(menu.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it 'is invalid with a duplicate name' do
    menu1 = FactoryBot.create(:menu, name: 'Nasi Uduk')
    menu2 = FactoryBot.build(:menu, name: 'Nasi Uduk')
    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a description more than 150 words' do
    menu = FactoryBot.build(:menu, description: 'You might be wondering, hey, I have not written any additional code, but the spec is green. Should I just skip this spec? While it is a valid question, we deem its necessary to keep this spec as it is a contract of our model: all Food should have a name and a description.')
    menu.valid?
    expect(menu.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  it"should have_many :categorizations" do
      expect(Menu.reflect_on_association(:categorizations).macro).to eq :has_many
  end

  it"should have_many :order_details" do
    expect(Menu.reflect_on_association(:order_details).macro).to eq :has_many
end
end
