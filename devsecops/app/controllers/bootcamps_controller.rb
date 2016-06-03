class BootcampsController < ApplicationController
  before_action :set_bootcamp, only: [:show, :edit, :update, :destroy]

  # GET /bootcamps
  # GET /bootcamps.json
  def index
    @bootcamps = Bootcamp.all
    if params[:search].to_s != ''
      @bootcamps = Bootcamp.where("name LIKE '%#{params[:search]}%'")
    else
      @bootcamps = Bootcamp.all
    end
  end

  # GET /bootcamps/1
  # GET /bootcamps/1.json
  def show
  end

  # GET /bootcamps/new
  def new
    @bootcamp = Bootcamp.new
  end

  # GET /bootcamps/1/edit
  def edit
  end

  # POST /bootcamps
  # POST /bootcamps.json
  def create
    @bootcamp = Bootcamp.new(bootcamp_params)

    respond_to do |format|
      if @bootcamp.save
        format.html { redirect_to @bootcamp, notice: 'Bootcamp was successfully created.' }
        format.json { render :show, status: :created, location: @bootcamp }
      else
        format.html { render :new }
        format.json { render json: @bootcamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bootcamps/1
  # PATCH/PUT /bootcamps/1.json
  def update
    respond_to do |format|
      if @bootcamp.update(bootcamp_params)
        format.html { redirect_to @bootcamp, notice: 'Bootcamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @bootcamp }
      else
        format.html { render :edit }
        format.json { render json: @bootcamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bootcamps/1
  # DELETE /bootcamps/1.json
  def destroy
    @bootcamp.destroy
    respond_to do |format|
      format.html { redirect_to bootcamps_url, notice: 'Bootcamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bootcamp
      @bootcamp = Bootcamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bootcamp_params
      params.require(:bootcamp).permit(:name, :description, :dates)
    end
end
