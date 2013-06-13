class Spinach::Features::Homepage < Spinach::FeatureSteps
  step 'I have a couple of products' do
    @products = 5.times.map { Product.create(name: Faker::Name.name) }

  end

  step 'I am looking at the homepage' do
    visit '/'
  end

  step 'I should see the homepage' do
    @products.each do |product|
      page.should have_content product.name
    end
  end
end
