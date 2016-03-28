describe Product do
  it 'works' do
    category = Category.create!(name: 'category1')
    product1 = Product.create!(name: 'product1', title: 'product1', sku: 'sku1', category: category)
    product2 = Product.create!(name: 'product2', title: 'product2', sku: 'sku2', category: category)

    product3 = Product.create!(name: 'product3', title: 'product3', sku: 'sku3', category: category, related_product_ids: [product1.id, product1.id])

    product3.reload
    expect(product3.related_product_ids).to eq [product1.id]

    product3.related_product_ids = [product2.id, product2.id]
    product3.reload
    expect(product3.related_product_ids).to eq [product2.id]
  end
end
