class ProductSpecsController < ApplicationController
  before_action :set_product_spec, only: [:show, :edit, :update, :destroy]

  # GET /product_specs
  # GET /product_specs.json
  def index
    @product_specs = ProductSpec.all
  end

  # GET /product_specs/1
  # GET /product_specs/1.json
  def show
  end

  # GET /product_specs/new
  def new
    @product_spec = ProductSpec.new
  end

  # GET /product_specs/1/edit
  def edit
  end

  # POST /product_specs
  # POST /product_specs.json
  def create
    @product_spec = ProductSpec.new(product_spec_params)

    respond_to do |format|
      if @product_spec.save
        format.html { redirect_to @product_spec, notice: 'Product spec was successfully created.' }
        format.json { render :show, status: :created, location: @product_spec }
      else
        format.html { render :new }
        format.json { render json: @product_spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_specs/1
  # PATCH/PUT /product_specs/1.json
  def update
    respond_to do |format|
      if @product_spec.update(product_spec_params)
        format.html { redirect_to @product_spec, notice: 'Product spec was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_spec }
      else
        format.html { render :edit }
        format.json { render json: @product_spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_specs/1
  # DELETE /product_specs/1.json
  def destroy
    @product_spec.destroy
    respond_to do |format|
      format.html { redirect_to product_specs_url, notice: 'Product spec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_spec
      @product_spec = ProductSpec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_spec_params
      params.fetch(:product_spec, {})
    end
end
