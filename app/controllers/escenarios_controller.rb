class EscenariosController < ApplicationController
  before_action :set_escenario, only: [:show, :edit, :update, :destroy]

  # GET /escenarios
  # GET /escenarios.json
  def index
    @escenarios = Escenario.all
  end

  # GET /escenarios/1
  # GET /escenarios/1.json
  def show
  end

  # GET /escenarios/new
  def new
    @escenario = Escenario.new
  end

  # GET /escenarios/1/edit
  def edit
  end

  # POST /escenarios
  # POST /escenarios.json
  def create
    @escenario = Escenario.new(escenario_params)

    if @escenario.save
      redirect_to :controller=>'optimizador', :action => 'guardarUltimoEscenario', :id_escenario => @escenario.id
    else
      render "Error"
    end
  end

  # PATCH/PUT /escenarios/1
  # PATCH/PUT /escenarios/1.json
  def update
    respond_to do |format|
      if @escenario.update(escenario_params)
        format.html { redirect_to @escenario, notice: 'Escenario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @escenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escenarios/1
  # DELETE /escenarios/1.json
  def destroy
    @escenario.destroy
    respond_to do |format|
      format.html { redirect_to escenarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escenario
      @escenario = Escenario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escenario_params
      params.require(:escenario).permit(:nombre)
    end
end
