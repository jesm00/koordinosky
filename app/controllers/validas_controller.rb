class ValidasController < ApplicationController
  before_action :set_valida, only: [:show, :edit, :update, :destroy]

  # GET /validas
  # GET /validas.json
  def index
    @validas = Valida.all
  end

  # GET /validas/1
  # GET /validas/1.json
  def show
  end

  # GET /validas/new
  def new
    @valida = Valida.new
  end

  # GET /validas/1/edit
  def edit
  end

  # POST /validas
  # POST /validas.json
  def create
    @valida = Valida.new(valida_params)

    respond_to do |format|
      if @valida.save
        format.html { redirect_to @valida, notice: 'Valida was successfully created.' }
        format.json { render action: 'show', status: :created, location: @valida }
      else
        format.html { render action: 'new' }
        format.json { render json: @valida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /validas/1
  # PATCH/PUT /validas/1.json
  def update
    respond_to do |format|
      if @valida.update(valida_params)
        format.html { redirect_to @valida, notice: 'Valida was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @valida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validas/1
  # DELETE /validas/1.json
  def destroy
    @valida.destroy
    respond_to do |format|
      format.html { redirect_to validas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valida
      @valida = Valida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valida_params
      params[:valida]
    end
end
