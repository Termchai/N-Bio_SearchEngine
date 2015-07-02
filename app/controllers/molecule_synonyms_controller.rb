class MoleculeSynonymsController < ApplicationController
  before_action :set_molecule_synonym, only: [:show, :edit, :update, :destroy]

  # GET /molecule_synonyms
  # GET /molecule_synonyms.json
  def index
    @molecule_synonyms = MoleculeSynonym.all
  end

  # GET /molecule_synonyms/1
  # GET /molecule_synonyms/1.json
  def show
  end

  # GET /molecule_synonyms/new
  def new
    @molecule_synonym = MoleculeSynonym.new
    @molecules = Molecule.all
  end

  # GET /molecule_synonyms/1/edit
  def edit
    @molecules = Molecule.all
  end

  # POST /molecule_synonyms
  # POST /molecule_synonyms.json
  def create
    @molecule_synonym = MoleculeSynonym.new(molecule_synonym_params)

    respond_to do |format|
      if @molecule_synonym.save
        format.html { redirect_to @molecule_synonym, notice: 'Molecule synonym was successfully created.' }
        format.json { render :show, status: :created, location: @molecule_synonym }
      else
        format.html { render :new }
        format.json { render json: @molecule_synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /molecule_synonyms/1
  # PATCH/PUT /molecule_synonyms/1.json
  def update
    respond_to do |format|
      if @molecule_synonym.update(molecule_synonym_params)
        format.html { redirect_to @molecule_synonym, notice: 'Molecule synonym was successfully updated.' }
        format.json { render :show, status: :ok, location: @molecule_synonym }
      else
        format.html { render :edit }
        format.json { render json: @molecule_synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /molecule_synonyms/1
  # DELETE /molecule_synonyms/1.json
  def destroy
    @molecule_synonym.destroy
    respond_to do |format|
      format.html { redirect_to molecule_synonyms_url, notice: 'Molecule synonym was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_molecule_synonym
      @molecule_synonym = MoleculeSynonym.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def molecule_synonym_params
      params.require(:molecule_synonym).permit(:molecule_id, :synonym)
    end
end
