class MachinesController < ApplicationController
  before_action :authenticate_company!

  def index
    @machines = Machine.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@machines) do |machine, marker|
      marker.lat machine.latitude
      marker.lng machine.longitude
    end
  end

  def show
    @company = current_company
    @machine = Machine.find(params[:id])
    @machines_count = current_company.machines.size
    @category = @machine.categories
  end

  def new
   # @machine_category = MachineCategory.find(params[:machine_id])
   @company = current_company
   @machine = Machine.new
 end

 def create
  @company = current_company
  @machine = Machine.new(machine_params)
  @machine.company_id = @company.id
  @machine.save

  params[:category].each do |category|
    @machine.machine_categories.create(category_id: Category.find_by(name: category).id)
  end
  redirect_to machine_path(@machine)
end

def edit
  @machine = Machine.find(params[:id])
end

def update
  @machine = Machine.find(params[:id])
  if @machine.update(machine_params)
  redirect_to machine_path(@machine)
else
  render :edit
end
end

def destroy
  @machine = Machine.find(params[:id])
  @machine.destroy
  redirect_to new_machine_path
end

private

def machine_params
  params.require(:machine).permit(:address, :building_photo, :machine_photo)
end
end
