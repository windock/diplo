class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = wrap_entity_collection(repository.sorted_by_name)
  end

  def new
    @category = wrap_entity(Domain::Category.new)
  end

  def edit
  end

  def create
    @category = wrap_entity(Domain::Category.new(name: category_params[:name],
                                                 description: category_params[:description]))
    if @category.valid?
      repository.persist(@category)
      redirect_to edit_category_path(@category), notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    @category.name = category_params[:name]
    @category.description = category_params[:description]

    if @category.valid?
      repository.persist(@category)
      redirect_to edit_category_path(@category), notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    repository.remove(@category)
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

    def set_category
      @category = wrap_entity(repository.find(params[:id]))
    end


    def category_params
      params.require(:category)
    end

    def repository
      Registry.category_repository
    end
end
