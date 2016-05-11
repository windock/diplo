class ProductsController < ApplicationController
  def index
    @products = wrap_entity_collection(repository.sorted_by_name)
  end

  def new
    @product_form = Infrastructure::ProductForm.build_new
    #build_translations(@product)
  end

  def new2
    @product = Product.new
    #build_translations(@product)
  end

  def edit
    product = repository.find(params[:id])
    @product_form = Infrastructure::ProductForm.build_edit(product)
    #build_translations(@product)
  end

  def create
    @product_form = Infrastructure::ProductForm.build_new(product_params)

    if @product_form.valid?
      product = @product_form.build_product
      repository.persist(product)
      redirect_to edit_product_path(id: product.id), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    product = repository.find(params[:id])

    @product_form = Infrastructure::ProductForm.build_edit(product, product_params)
    if @product_form.valid?
      @product_form.update_product
      repository.persist(product)
      redirect_to edit_product_path(id: product.id), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    repository.remove(repository.find(params[:id]))
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def build_translations(product)
      Domain::Language.to_a.each do |language|
        if product.translations.none? { |t| t.language == language }
          product.translations.build(language: language)
        end
      end
    end

    helper_method def available_related_products
      if @product
        repository.sorted_by_name.reject { |p| p.id == @product.id }
      else
        repository.sorted_by_name
      end
    end

    def product_params
      params.require(:product)
    end

    def repository
      Registry.product_repository
    end
end
