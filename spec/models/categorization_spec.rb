require 'rails_helper'

RSpec.describe Categorization, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:categorization)).to be_valid
  end

  it 'is valid with a menu_id and a category_id' do
    categorization = FactoryBot.build(:categorization)
    expect(categorization).to be_valid
  end

  it 'is invalid without a menu_id' do
    categorization = FactoryBot.build(:categorization, menu_id: nil)
    categorization.valid?
    expect(categorization.errors[:menu_id]).to include("can't be blank")
  end

  it 'is invalid without a category_id' do
    categorization = FactoryBot.build(:categorization, category_id: nil)
    categorization.valid?
    expect(categorization.errors[:category_id]).to include("can't be blank")
  end

  it 'should belong_to menu' do
      expect(ItemCategory.reflect_on_association(:menu).macro).to eq :belongs_to
  end

  it "should belong_to category" do
      expect(ItemCategory.reflect_on_association(:category).macro).to eq :belongs_to
  end
end
