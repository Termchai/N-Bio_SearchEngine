class InteractsController < ApplicationController
  before_action :set_interact, only: [:show, :edit, :update, :destroy]

  # GET /interacts
  # GET /interacts.json
  def index
    @interacts = Interact.all
    @molecules = Molecule.all
  end

  # GET /interacts/1
  # GET /interacts/1.json
  def show
  end

  # GET /interacts/new
  def new
    @interact = Interact.new
    @molecules = Molecule.all
  end

  # GET /interacts/1/edit
  def edit
  end

  # POST /interacts
  # POST /interacts.json
  def create
    @interact = Interact.new(interact_params)

    respond_to do |format|
      if @interact.save
        format.html { redirect_to @interact, notice: 'Interact was successfully created.' }
        format.json { render :show, status: :created, location: @interact }
      else
        format.html { render :new }
        format.json { render json: @interact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interacts/1
  # PATCH/PUT /interacts/1.json
  def update
    respond_to do |format|
      if @interact.update(interact_params)
        format.html { redirect_to @interact, notice: 'Interact was successfully updated.' }
        format.json { render :show, status: :ok, location: @interact }
      else
        format.html { render :edit }
        format.json { render json: @interact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interacts/1
  # DELETE /interacts/1.json
  def destroy
    @interact.destroy
    respond_to do |format|
      format.html { redirect_to interacts_url, notice: 'Interact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interact
      @interact = Interact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interact_params
      params.require(:interact).permit(:m1, :m2, :source)
    end
end
