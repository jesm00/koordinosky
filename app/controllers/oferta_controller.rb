class OfertaController < ApplicationController
  before_action :set_oferta, only: [:show, :edit, :update, :destroy]

  # GET /oferta
  # GET /oferta.json
  def index
    @oferta = Oferta.all
  end

  # GET /oferta/1
  # GET /oferta/1.json
  def show
  end

  # GET /oferta/new
  def new
    @oferta = Oferta.new
  end

  # GET /oferta/1/edit
  def edit
  end

  # POST /oferta
  # POST /oferta.json
  def create
    @oferta = Oferta.new(oferta_params)

    respond_to do |format|
      if @oferta.save
        format.html { redirect_to @oferta, notice: 'Oferta was successfully created.' }
        format.json { render action: 'show', status: :created, location: @oferta }
      else
        format.html { render action: 'new' }
        format.json { render json: @oferta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oferta/1
  # PATCH/PUT /oferta/1.json
  def update
    respond_to do |format|
      if @oferta.update(oferta_params)
        format.html { redirect_to @oferta, notice: 'Oferta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @oferta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oferta/1
  # DELETE /oferta/1.json
  def destroy
    @oferta.destroy
    respond_to do |format|
      format.html { redirect_to oferta_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oferta
      @oferta = Oferta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oferta_params
      params.require(:oferta).permit(:cupos,:curso_id,:escenario_id)
    end
end
