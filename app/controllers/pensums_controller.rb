class PensumsController < ApplicationController
  before_action :set_pensum, only: [:show, :edit, :update, :destroy]

  # GET /pensums
  # GET /pensums.json
  def index
    @pensums = Pensum.all
    $semestres=Array.new
    i=1
    while i < 21  do
      $semestres.push(i.to_s)
      i+=1
    end
  end

  # GET /pensums/1
  # GET /pensums/1.json
  def show
  end

  # GET /pensums/new
  def new
    @pensum = Pensum.new
  end

  # GET /pensums/1/edit
  def edit
  end

  # POST /pensums
  # POST /pensums.json
  def create
    @pensum = Pensum.new(pensum_params)

    respond_to do |format|
      if @pensum.save
        format.html { redirect_to @pensum, notice: 'Pensum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pensum }
      else
        format.html { render action: 'new' }
        format.json { render json: @pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pensums/1
  # PATCH/PUT /pensums/1.json
  def update
    respond_to do |format|
      if @pensum.update(pensum_params)
        format.html { redirect_to @pensum, notice: 'Pensum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pensums/1
  # DELETE /pensums/1.json
  def destroy
    @pensum.destroy
    respond_to do |format|
      format.html { redirect_to pensums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pensum
      @pensum = Pensum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pensum_params
      params.require(:pensum).permit(:curso_id, :programa_id, :semestre)
    end
end
