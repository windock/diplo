class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order(:name)
  end

  def new
    @product = Product.new
    build_translations(@product)
  end

  def edit
    build_translations(@product)
  end

  def create
    @product = Product.new(product_params)
    build_translations(@product)

    if @product.save
      redirect_to edit_product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def build_translations(product)
      Domain::Language.to_a.each do |language|
        if product.translations.none? { |t| t.language == language }
          product.translations.build(language: language)
        end
      end
    end

    helper_method def available_related_products
      Product.order(:name).reject { |p| p.id == @product.id }
    end

    def product_params
      params.require(:product).permit(
        :title, :name, :description, :primary_concern, :skin_type, :sku, :price,
        :category_id,
        market_ids: [],
        translations_attributes: [:id, :title, :description, :language],
        related_product_ids: [],
      )
    end
end
