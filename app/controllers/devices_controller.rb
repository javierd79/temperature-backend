class DevicesController < ApplicationController
  def index
    @devices = Device.all
    render json: @devices, status: :ok
  end

  def show
    ActionCable.server.broadcast('status', { message: Time.now.to_i })
    render json: @device, status: :ok
  end

  def handle_active
    if Device.change_active
      ActionCable.server.broadcast('status', { message: Time.now.to_i })
      render json: { message: 'Ok' } , status: :ok
    else
      render json: { error: 'Unprocessable entity' }, status: :unprocessable_entity
    end
  end

  private

  def device_params
    params.require(:device).permit(:name)
  end

  def set_device
    @device = Device.find_by(params[:token])
  end
end
