class MachinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_company!, only: [:new, :create]
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
end

private

def machine_params
  params.require(:machine).permit(:address, :building_photo, :machine_photo)
end
end
