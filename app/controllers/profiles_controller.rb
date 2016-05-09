class ProfilesController < ApplicationController
  def index
    @profiles = wrap_entity_collection(repository.sorted_by_name)
  end

  def new
    @profile_form = Infrastructure::ProfileForm.build_new
  end

  def edit
    profile = repository.find(params[:id])
    @profile_form = Infrastructure::ProfileForm.build_edit(profile)
  end

  def create
    @profile_form = Infrastructure::ProfileForm.build_new(profile_params)

    if @profile_form.valid?
      profile = @profile_form.build_profile
      repository.persist(profile)
      redirect_to edit_profile_path(id: profile.id), notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def update
    profile = repository.find(params[:id])

    @profile_form = Infrastructure::ProfileForm.build_edit(profile, profile_params)
    if @profile_form.valid?
      @profile_form.update_profile
      repository.persist(profile)
      redirect_to edit_profile_path(id: profile.id), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    repository.remove(repository.find(params[:id]))
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private

    def profile_params
      params.require(:profile)
    end

    def repository
      Registry.profile_repository
    end
end
