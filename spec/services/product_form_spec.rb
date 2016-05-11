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
  describe 'coerces attributes' do
    specify 'for new' do
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
        market_ids: [5],
        translations: []
      )
    end

    specify 'for edit' do
      product = Domain::Product.new(
        id: 1,
        name: 'name1',
        sku: 'sku1',
        category_id: 4,
        title: 'title1',
        description: 'descr1',
        primary_concern_id: 3,
        skin_type: Domain::Product::SkinType::Combination,
        price: 53,
        market_ids: [5],
      )
      product.translations = [
        Domain::ProductTranslation.new(
          title: 'tr_en1',
          description: 'desc_en1',
          language: Domain::Language::English
        )
      ]
      form = Infrastructure::ProductForm.build_edit(product)
      expect(form).to have_attributes(
        name: 'name1',
        sku: 'sku1',
        category_id: 4,
        title: 'title1',
        description: 'descr1',
        primary_concern_id: 3,
        skin_type: 'Combination',
        price: 53,
        market_ids: [5],
        translations: contain_exactly(
          have_attributes(
            title: 'tr_en1',
            description: 'desc_en1',
            language: 'English',
            model_class: Domain::ProductTranslation
          )
        )
      )
    end
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
