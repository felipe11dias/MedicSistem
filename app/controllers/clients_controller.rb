class ClientsController < ApplicationController
  before_action :authenticate_manager!, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
  end

  # GET /clients/new
  def new
    @client = Client.new
    @doctors = Doctor.all
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @doctors = Doctor.all
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    
    respond_to do |format|
      if @client.save
        format.html { redirect_to client_path(@client.id), notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        @client = Client.new
        @doctors = Doctor.all
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        def set_manager
          @manager = Manager.find(params[:id])
        endformat.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:full_name, :cpf, :birthday, :doctor_id)
    end
end
