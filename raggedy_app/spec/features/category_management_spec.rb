require 'spec_helper'

describe 'User adding category and sub category to items' do

	before do
		user = FactoryGirl.create(:user)
		login_as(user)
		load "#{Rails.root}/db/seeds.rb"
	end

	it 'adds category to product' do
		visit new_product_path
		fill_in 'Title', with: 'My product'
		select 'Dresses', from: 'Category'
		click_button 'Create Product'

		expect(Product.last.sub_category.name).to eq 'Dresses'

	end 





end 