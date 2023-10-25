class Api::V1::PilotsController < ApplicationController
  def index
    pilots = Pilot.all()
    render json:pilots, status: 200
  end

  def new 
    pilot = Pilot.new 
  end
  def create
    pilot = Pilot.new(
      name: pilot_params[:name],
      age: pilot_params[:age],
      credits: pilot_params[:credits],
      location_planet: pilot_params[:location_planet]
    )
    if pilot.save
      render json:pilot, status: 200
    else
      render json: { error: "Creating error!" }
    end
  end

  def show
    pilot = Pilot.find(params[:id])
    if pilot
      render json:pilot, status: 200
    else
      render json: { error: "Pilot not found!" }
    end
  end

  private
    def pilot_params
      params.require(:pilot).permit(:name, :age, :credits, :location_planet)
    end
end