class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
    @snack = @machine.snacks
    @avg_price = @machine.average_snack_price
  end
end
