class SupermercadosController < ApplicationController
  before_action :set_supermercado, only: [:show, :edit, :update, :destroy]

  # GET /supermercados
  # GET /supermercados.json
  def index
    @supermercados = Supermercado.all
  end

  # GET /supermercados/1
  # GET /supermercados/1.json
  def show
  end

  # GET /supermercados/new
  def new
    @supermercado = Supermercado.new
  end

  # GET /supermercados/1/edit
  def edit
  end

  # POST /supermercados
  # POST /supermercados.json
  def create
    @supermercado = Supermercado.new(supermercado_params)

    respond_to do |format|
      if @supermercado.save
        format.html { redirect_to @supermercado, notice: 'Supermercado was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supermercado }
      else
        format.html { render action: 'new' }
        format.json { render json: @supermercado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supermercados/1
  # PATCH/PUT /supermercados/1.json
  def update
    respond_to do |format|
      if @supermercado.update(supermercado_params)
        format.html { redirect_to @supermercado, notice: 'Supermercado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supermercado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supermercados/1
  # DELETE /supermercados/1.json
  def destroy
    @supermercado.destroy
    respond_to do |format|
      format.html { redirect_to supermercados_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supermercado
      @supermercado = Supermercado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supermercado_params
      params.require(:supermercado).permit(:logo, :nombre)
    end
end
