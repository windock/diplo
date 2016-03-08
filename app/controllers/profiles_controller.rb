class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to edit_profile_path(@profile), notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def update
    @profile.attributes = profile_params
    if @profile.update(profile_params)
      redirect_to edit_profile_path(@profile), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :description, :language_id, :welcome_button1, :welcome_button2, :welcome_button3)
    end
end
