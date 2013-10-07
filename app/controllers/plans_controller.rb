class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update]

  # GET /plans
  # GET /plans.json
  def index
	#Recibir el id del estudiante a trabajar
	id_est=params[:estudiante_id].to_i
	#Si se recibio un id valido obtener el estudiante que tenga ese id
	if id_est!=0
		$estudiante=Estudiante.find(id_est)
	end
	#Si el id era invalido y aun no se a cargado un estudiante cargar el primero de la base de datos
	if $estudiante.nil?
		$estudiante=Estudiante.first()
	end
    @plans = Plan.where(estudiante_id:  $estudiante.id)
    $semestres=Array.new

    num_anios=($estudiante.programa.duracion-$estudiante.semestre_actual)/2+2

    i=0
    anio=2014
    while i < num_anios  do
      $semestres.push(anio.to_s+"10")
      $semestres.push(anio.to_s+"19")
      $semestres.push(anio.to_s+"20")
      i+=1
      anio+=1
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    #Revisar que haya seleccionado un curso
    if params[:plan]
  	   #Revisar que la materia no exista previamente en el plan de estudios del estudiante
      if not(Plan.exists?(estudiante_id: $estudiante.id,curso_id: params[:plan][:curso_id]))
  		  #De no existir se intenta agregar al plan de estudios
  		  @plan = Plan.new(plan_params)
    		respond_to do |format|
    		  if @plan.save
    			format.html { redirect_to @plan, notice: 'Plan creado correctamente.' }
    			format.json { render action: 'show', status: :created, location: @plan }
    		  else
    			format.html { render action: 'new' }
    			format.json { render json: @plan.errors, status: :unprocessable_entity }
    		  end
    		end
  	  else
    		@plan = Plan.new(plan_params)
    		@plan.errors.add(:base, "La materia seleccionada ya esta en su plan de estudios ")
    		respond_to do |format|
    			format.html { render action: 'new' }
    			format.json { render json: @plan.errors, status: :unprocessable_entity }
  		  end
  	  end
    else
      params[:plan]=Hash.new
      params[:plan][:curso_id]='0'
      params[:plan][:estudiante_id]=$estudiante.id.to_s
      params.require(:plan).permit(:curso_id, :estudiante_id)
      @plan = Plan.new(plan_params)
      @plan.errors.add(:base, "Por favor seleccione un curso")
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end


  def eliminar
    Plan.where(estudiante_id: $estudiante.id,curso_id: params[:curso_id]).delete_all
    respond_to do |format|
      if not(Plan.exists?(estudiante_id: $estudiante.id,curso_id: params[:curso_id]))
        format.html { redirect_to plans_path, notice: 'Se elimino la materia del plan de estudios correctamente'}        
        format.json { head :no_content }
      else
        format.html { redirect_to plans_path, notice: 'No se logro eliminar la materia del plan de estudios'}        
        format.json { head :no_content }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params[:plan][:estudiante_id]=$estudiante.id.to_s
      if not(params[:plan][:semestre])
        params[:plan][:semestre]=$semestres.first
      end
      params.require(:plan).permit(:curso_id, :estudiante_id, :semestre)
    end
end
