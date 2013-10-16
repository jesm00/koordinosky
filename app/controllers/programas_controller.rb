class ProgramasController < ApplicationController
  before_action :set_programa, only: [:show, :edit, :update, :destroy]

  # GET /programas
  # GET /programas.json
  def index
    @programas = Programa.paginate(page: params[:page], :per_page => 10)
  end

  # GET /programas/1
  # GET /programas/1.json
  def show
  end

  # GET /programas/new
  def new
    @programa = Programa.new
  end

  # GET /programas/1/edit
  def edit
  end

  # POST /programas
  # POST /programas.json
  def create
    @programa = Programa.new(programa_params)

    respond_to do |format|
      if @programa.save
        format.html { redirect_to @programa, notice: 'Programa was successfully created.' }
        format.json { render action: 'show', status: :created, location: @programa }
      else
        format.html { render action: 'new' }
        format.json { render json: @programa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programas/1
  # PATCH/PUT /programas/1.json
  def update
    respond_to do |format|
      if @programa.update(programa_params)
        format.html { redirect_to @programa, notice: 'Programa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @programa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programas/1
  # DELETE /programas/1.json
  def destroy
    @programa.destroy
    respond_to do |format|
      format.html { redirect_to programas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programa
      @programa = Programa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programa_params
      params.require(:programa).permit(:nombre, :es_maestria, :duracion)
    end
end
