class MachinesController < ApplicationController
  def index
    @machines = Machine.where.not(latitude: nil, longitude: nil)
    @hash  = Gmaps4rails.build_markers @machines do |machine, marker|
      marker.lat machine.latitude
      marker.lng machine.longitude
      marker.infowindow render_to_string(partial: "/machines/map_box", locals: { machine: machine })
      # Works with Placehold.it
      # marker.picture({
      #                 :url    => "https://www.iconexperience.com/_img/o_collection_png/green_dark_grey/512x512/plain/vending_machine.png",
      #                 :width  => "32",
      #                 :height => "32"
      #                })
      marker.title   "i'm the title"
      marker.json({ :id => machine.id })
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
  redirect_to "/machines/new", :notice => "Your machine has been deleted"
end

private

def machine_params
  params.require(:machine).permit(:address, :building_photo, :machine_photo)
end
end
