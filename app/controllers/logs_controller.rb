class LogsController < ApplicationController
  before_action :set_log, except: [:index, :last]
  before_action :verify_token

  # GET /logs
  def index
    @logs = Log.all

    render json: @logs, status: :ok
  end

  # GET /logs/last
  def last
    @log = Log.where(device_id: @device.id).last
    render json: @log, status: :ok
  end

  # GET /logs/1
  def show
    render json: @log, status: :ok
  end

  # POST /logs
  def create
    @log = Log.new(log_params.except(:token))
    @device = Device.find_by(token: log_params[:token])

    @log.device_id = @device.id

    if @log.save
      render json: @log, status: :created, location: @log
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /logs/1
  # def update
  #   if @log.update(log_params)
  #     render json: @log, status: :ok
  #   else
  #     render json: @log.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /logs/1
  # def destroy
  #   if @log.destroy
  #     render json: @log, status: :ok
  #   else
  #     render json: @log.errors, status: :unprocessable_entity
  #   end
  # end

  private

  def set_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:temperature, :humidity, :archive_id, :token)
  end

  def verify_token
    @device = Device.last

    render json: { message: "Device doesn't exist" }, status: :unauthorized unless @device
  end
end
