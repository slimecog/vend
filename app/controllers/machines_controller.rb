class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
  end

  private

    def average_price
      # average(self.snacks.price)
    end
end
