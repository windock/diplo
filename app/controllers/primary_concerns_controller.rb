class PrimaryConcernsController < ApplicationController
  before_action :set_primary_concern, only: [:edit, :update, :destroy]

  def index
    @primary_concerns = wrap_entity_collection(repository.sorted_by_name)
  end

  def new
    @primary_concern = wrap_entity(Domain::PrimaryConcern.new)
  end

  def edit
  end

  def create
    @primary_concern = wrap_entity(PrimaryConcern.new(name: primary_concern_params[:name],
                                                      description: primary_concern_params[:description]))

    if repository.persist_new(@primary_concern)
      redirect_to edit_primary_concern_path(@primary_concern), notice: 'PrimaryConcern was successfully created.'
    else
      render :new
    end
  end

  def update
    @primary_concern.name = primary_concern_params[:name]
    @primary_concern.description = primary_concern_params[:description]

    if repository.persist_existing(@primary_concern)
      redirect_to edit_primary_concern_path(@primary_concern), notice: 'PrimaryConcern was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    repository.remove(@primary_concern)
    redirect_to primary_concerns_url, notice: 'PrimaryConcern was successfully destroyed.'
  end

  private

    def set_primary_concern
      @primary_concern = wrap_entity(repository.find(params[:id]))
    end


    def primary_concern_params
      params.require(:primary_concern).permit(:name, :description)
    end

    def repository
      Registry.primary_concern_repository
    end
end

