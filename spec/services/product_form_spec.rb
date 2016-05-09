describe Infrastructure::ProductForm do
  let(:attributes) do
    {
      'name'=>'name1',
      'sku'=>'sku1',
      'category_id'=>'4',
      'title'=>'title1',
      'description'=>'descr1',
      'primary_concern_id'=>'3',
      'skin_type'=>'Combination',
      'price'=>'53',
      'market_ids'=>['', '5']
    }
  end
  it 'coerces attributes' do
    form = Infrastructure::ProductForm.build_new(attributes)
    expect(form).to have_attributes(
      name: 'name1',
      sku: 'sku1',
      category_id: 4,
      title: 'title1',
      description: 'descr1',
      primary_concern_id: 3,
      skin_type: 'Combination',
      price: 53,
      market_ids: [5]
    )
  end

  it 'builds a product' do
    form = Infrastructure::ProductForm.build_new(attributes)
    product = form.build_product
    expect(product).to have_attributes(
      name: 'name1',
      sku: 'sku1',
      category_id: 4,
      title: 'title1',
      description: 'descr1',
      primary_concern_id: 3,
      skin_type: Domain::Product::SkinType::Combination,
      price: 53,
      market_ids: [5]
    )
  end
end
