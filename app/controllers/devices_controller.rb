class DevicesController < ApplicationController
  before_action :set_device, only: [:edit, :update, :destroy]

  def index
    @devices = Device.all.order(:name)
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to edit_device_path(@device), notice: 'Device was successfully created.'
    else
      render :new
    end
  end

  def update
    if @device.update(device_params)
      redirect_to edit_device_path(@device), notice: 'Device was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_url, notice: 'Device was successfully destroyed.'
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:username, :device_type, :lifecycle, :email_enabled, :printer_enabled, :profile_id)
    end
end
