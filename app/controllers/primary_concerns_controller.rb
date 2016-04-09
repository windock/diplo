class PrimaryConcernsController < ApplicationController
  before_action :set_primary_concern, only: [:show, :edit, :update, :destroy]

  def index
    @primary_concerns = PrimaryConcern.all.order(:name)
  end

  def new
    @primary_concern = PrimaryConcern.new
  end

  def edit
  end

  def create
    @primary_concern = PrimaryConcern.new(primary_concern_params)

    if @primary_concern.save
      redirect_to edit_primary_concern_path(@primary_concern), notice: 'PrimaryConcern was successfully created.'
    else
      render :new
    end
  end

  def update
    if @primary_concern.update(primary_concern_params)
      redirect_to edit_primary_concern_path(@primary_concern), notice: 'PrimaryConcern was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @primary_concern.destroy
    redirect_to primary_concerns_url, notice: 'PrimaryConcern was successfully destroyed.'
  end

  private

    def set_primary_concern
      @primary_concern = PrimaryConcern.find(params[:id])
    end


    def primary_concern_params
      params.require(:primary_concern).permit(:name, :description)
    end
end

