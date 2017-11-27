class Api::V1::MachinesController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show ]

  def index
    @machines = Machine.all
  end

  def show
  end

  private

  def set_restaurant
    @machine = Machine.find(params[:id])
  end
end
