require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:item_category)).to be_valid
  end

  it 'is valid with a menu_id and a category_id' do
    item_category = FactoryBot.build(:item_category)
    expect(item_category).to be_valid
  end

  it 'is invalid without a menu_id' do
    item_category = FactoryBot.build(:item_category, menu_id: nil)
    item_category.valid?
    expect(item_category.errors[:menu_id]).to include("can't be blank")
  end

  it 'is invalid without a category_id' do
    item_category = FactoryBot.build(:item_category, category_id: nil)
    item_category.valid?
    expect(item_category.errors[:category_id]).to include("can't be blank")
  end

  it 'is invalid with a duplicate menu_id and category_id' do
    item_category1 = FactoryBot.create(:item_category, menu_id: 1, category_id: 1)
    item_category2 = FactoryBot.build(:item_category, menu_id: 1, category_id: 1)
    item_category2.valid?
    expect(item_category2.errors[:menu_id]).to include("has already been taken")
    expect(item_category2.errors[:category_id]).to include("has already been taken")
  end

  it 'should belong_to menu_item' do
      expect(ItemCategory.reflect_on_association(:menu_item).macro).to eq :belongs_to
  end

  it "should belong_to category" do
      expect(ItemCategory.reflect_on_association(:category).macro).to eq :belongs_to
  end
end
