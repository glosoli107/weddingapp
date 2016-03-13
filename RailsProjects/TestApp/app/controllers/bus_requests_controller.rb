class BusRequestsController < ApplicationController
  before_action :set_bus_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:new, :create]
  # GET /bus_requests
  # GET /bus_requests.json
  def index
    @bus_requests = BusRequest.all
  end

  # GET /bus_requests/1
  # GET /bus_requests/1.json
  def show
  end

  # GET /bus_requests/new
  def new
    @bus_request = BusRequest.new
    @new_message = NewMessage.new
  end

  # GET /bus_requests/1/edit
  def edit
  end


  # POST /bus_requests
  # POST /bus_requests.json
  def create
    @bus_request = BusRequest.new(bus_request_params)

    respond_to do |format|
      if @bus_request.save
        format.html { redirect_to "/wedding/contact", notice: 'Your request has been submitted. Thank you!' }
        format.json { render :show, status: :created, location: @bus_request }
      else
        format.html { redirect_to "/wedding/contact", alert: "You must enter your email address and one or more names before submitting the request." }
        format.json { render json: @bus_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_requests/1
  # PATCH/PUT /bus_requests/1.json
  def update
    respond_to do |format|
      if @bus_request.update(bus_request_params)
        format.html { redirect_to @bus_request, notice: 'Bus request was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_request }
      else
        format.html { render :edit }
        format.json { render json: @bus_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_requests/1
  # DELETE /bus_requests/1.json
  def destroy
    @bus_request.destroy
    respond_to do |format|
      format.html { redirect_to bus_requests_url, notice: 'Bus request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_request
      @bus_request = BusRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_request_params
      params.require(:bus_request).permit(:number_of_seats, :names, :bus_email)
    end
end
