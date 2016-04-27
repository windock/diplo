class DevicesController < ApplicationController
  def index
    @devices = wrap_entity_collection(repository.sorted_by_name)
  end

  def new
    @device_form = Infrastructure::DeviceForm.build_new
  end

  def create
    @device_form = Infrastructure::DeviceForm.build_new(device_params)

    if @device_form.valid?
      device = @device_form.build_device
      repository.persist(device)
      redirect_to edit_device_path(id: device.id), notice: 'Device was successfully created.'
    else
      render :new
    end
  end

  def edit
    device = repository.find(params[:id])
    @device_form = Infrastructure::DeviceForm.build_edit(device)
  end

  def update
    device = repository.find(params[:id])

    @device_form = Infrastructure::DeviceForm.build_edit(device, device_params)
    if @device_form.valid?
      @device_form.update_device
      repository.persist(device)
      redirect_to edit_device_path(id: device.id), notice: 'Device was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    repository.remove(repository.find(params[:id]))
    redirect_to devices_url, notice: 'Device was successfully destroyed.'
  end

  private
    def device_params
      params.require(:device)
    end

    def repository
      Registry.device_repository
    end
end
