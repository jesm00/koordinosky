class EstudiantesController < ApplicationController
  before_action :set_estudiante, only: [:show, :edit, :update, :destroy]

  # GET /estudiantes
  # GET /estudiantes.json
  def index
    #@estudiantes = Estudiante.all
    @estudiantes = Estudiante.paginate(page: params[:page], :per_page => 10)
  end

  # GET /estudiantes/1
  # GET /estudiantes/1.json
  def show
  end

  # GET /estudiantes/new
  def new
    @estudiante = Estudiante.new
  end

  # GET /estudiantes/1/edit
  def edit
  end

  # POST /estudiantes
  # POST /estudiantes.json
  def create
    #@estudiante = @programa.estudiantes.create(estudiante_params)
    @estudiante = Estudiante.new(estudiante_params)
    #TODO externalizar este valor
    periodo_actual="201320"
    respond_to do |format|
      if @estudiante.save
        #Asignarle pensum para los semestres que aun no a cursado
        #Seleccionar pensum sugerido para los semestres que aun no a cursado
        @pensums=Pensum.where(programa_id: @estudiante.programa.id).where("semestre >=?", @estudiante.semestre_actual)
        @pensums.each do |pensum|
            #Determinar el numero de periodos en el futuro en los que debera ver el curso
            num_sem=pensum.semestre-@estudiante.semestre_actual+1
            #Determinar el año en que deberia ver el curso si sigue el pensum
            anio=periodo_actual[0,4].to_i+(num_sem/2.0).ceil
            #Determinar el periodo en que deberia ver el curso si sigue el pensum (1 o 2)
            sem_actual=periodo_actual[4,2].to_i
            if sem_actual==10
              periodo=1+(num_sem%2)
            else
              periodo=2-(num_sem%2)
            end

            semestre=anio.to_s+periodo.to_s+"0"

            Plan.create(:curso_id=>pensum.curso.id,:estudiante_id => @estudiante.id, :semestre => semestre)
        end
        #sign_in @estudiante
        format.html { redirect_to @estudiante, notice: 'Estudiante was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estudiante }
      else
        format.html { render action: 'new' }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estudiantes/1
  # PATCH/PUT /estudiantes/1.json
  def update
    respond_to do |format|
      if @estudiante.update(estudiante_params)
        format.html { redirect_to @estudiante, notice: 'Estudiante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.json
  def destroy
    @estudiante.destroy
    respond_to do |format|
      format.html { redirect_to estudiantes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudiante
      @estudiante = Estudiante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estudiante_params
      params.require(:estudiante).permit(:nombre, :email, :semestre_actual,:programa_id, :password,:password_confirmation)
    end
end
