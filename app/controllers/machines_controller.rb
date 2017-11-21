class MachinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_company!, only: [:new, :create]

  def index
    @machines = Machine.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@machines) do |machine, marker|
      marker.lat machine.latitude
      marker.lng machine.longitude
    end
  end

  def new
    @company = current_company
    @machine = Machine.new
  end

  def create
    @company = current_company
    @machine = Machine.new(machine_params)
    @machine.company_id = @company.id
    @machine.save
  end

  private

  def machine_params
    params.require(:machine).permit(:address, :building_photo, :machine_photo)
  end
end
